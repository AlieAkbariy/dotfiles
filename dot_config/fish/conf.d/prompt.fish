function fish_prompt
    set -l last_status $status

    set -l normal (set_color normal)
    set -l muted (set_color 6e7681)
    set -l blue (set_color 79c0ff)
    set -l green (set_color 7ee787)
    set -l yellow (set_color e3b341)
    set -l red (set_color ff7b72)
    set -l purple (set_color d2a8ff)

    set -l cwd (prompt_pwd)
    set -l branch (_prompt_git_branch)
    set -l dirty (_prompt_git_dirty)

    printf '%s%s%s %s%s%s' "$muted" (whoami) "$normal" "$blue" "$cwd" "$normal"

    if test -n "$branch"
        printf ' %sgit:%s%s%s' "$muted" "$purple" "$branch" "$normal"
        if test -n "$dirty"
            printf '%s*%s' "$yellow" "$normal"
        end
    end

    if test $last_status -ne 0
        printf ' %s[%s]%s' "$red" "$last_status" "$normal"
    end

    printf '\n%s>%s ' "$green" "$normal"
end

function fish_right_prompt
    set -l normal (set_color normal)
    set -l muted (set_color 6e7681)

    if test "$CMD_DURATION" -gt 3000
        printf '%s%sms%s' "$muted" "$CMD_DURATION" "$normal"
    end
end

function _prompt_git_branch
    command git symbolic-ref --short HEAD 2>/dev/null
end

function _prompt_git_dirty
    command git status --porcelain --ignore-submodules=dirty 2>/dev/null
end
