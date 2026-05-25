#!/usr/bin/env bash
set -euo pipefail

agent_env="${XDG_RUNTIME_DIR:-/tmp}/ssh-agent.env"

if [[ -r "$agent_env" ]]; then
  # shellcheck disable=SC1090
  source "$agent_env"
fi

if [[ -n "${SSH_AUTH_SOCK:-}" && -S "${SSH_AUTH_SOCK:-}" ]]; then
  systemctl --user import-environment SSH_AUTH_SOCK SSH_AGENT_PID 2>/dev/null || true
  exit 0
fi

eval "$(ssh-agent -s)" >/dev/null
{
  printf 'export SSH_AUTH_SOCK=%q\n' "$SSH_AUTH_SOCK"
  printf 'export SSH_AGENT_PID=%q\n' "$SSH_AGENT_PID"
} > "$agent_env"
chmod 600 "$agent_env"

systemctl --user import-environment SSH_AUTH_SOCK SSH_AGENT_PID 2>/dev/null || true
