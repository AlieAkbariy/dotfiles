#!/usr/bin/env bash
set -euo pipefail

repo="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$repo"

echo "== chezmoi managed =="
chezmoi managed --source "$repo" >/dev/null

echo "== chezmoi dry run =="
chezmoi apply --dry-run --source "$repo" >/dev/null

echo "== shell syntax =="
find "$repo" -type f \( -name 'executable_*' -o -path '*/.chezmoiscripts/*.sh.tmpl' \) -print0 |
  while IFS= read -r -d '' file; do
    case "$file" in
      *.tmpl)
        rendered="$(mktemp)"
        chezmoi execute-template --source "$repo" < "$file" > "$rendered"
        bash -n "$rendered"
        rm -f "$rendered"
        ;;
      *)
        if head -n1 "$file" | grep -q '^#!/.*bash'; then
          bash -n "$file"
        fi
        ;;
    esac
  done

echo "== fish syntax =="
find "$repo/dot_config/fish" -type f \( -name '*.fish' -o -name '*.fish.tmpl' \) -print0 |
  while IFS= read -r -d '' file; do
    if command -v fish >/dev/null; then
      case "$file" in
        *.tmpl)
          rendered="$(mktemp)"
          chezmoi execute-template --source "$repo" < "$file" > "$rendered"
          fish -n "$rendered"
          rm -f "$rendered"
          ;;
        *)
          fish -n "$file"
          ;;
      esac
    fi
  done

echo "== package names =="
extract_array() {
  local array_name="$1"
  awk -v array_name="$array_name" '
    $0 ~ "^" array_name "=\\(" { in_array=1; next }
    /^\)/ && in_array { exit }
    in_array && $1 !~ /^#/ && NF == 1 { print $1 }
  ' "$repo/.chezmoiscripts/run_onchange_before_00-install-arch-packages.sh.tmpl"
}

extract_array official_packages |
  while read -r package; do
    pacman -Si "$package" >/dev/null
  done

extract_array aur_packages |
  while read -r package; do
    curl -fsSL --retry 3 --retry-delay 2 --retry-all-errors --connect-timeout 10 --max-time 30 \
      "https://aur.archlinux.org/rpc/v5/info?arg[]=$package" |
      rg -q "\"Name\":\"$package\""
  done

echo "== secret scan =="
if rg -n --glob '!tools/validate.sh' 'sshpass[[:space:]]+-p|49aZ|b7px|TgM7|dFHY|/home/ali|91\.107|65\.109' "$repo"; then
  echo "Potential secret or machine-specific path found." >&2
  exit 1
fi

echo "ok"
