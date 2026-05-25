if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Disabling greeting message of fish
set fish_greeting

set -Ux XDG_SESSION_TYPE wayland
set -Ux GDK_BACKEND wayland

set -x SSH_AUTH_SOCK $XDG_RUNTIME_DIR/ssh-agent.socket

if test -S $SSH_AUTH_SOCK
    ssh-add -l >/dev/null 2>&1
    or ssh-add ~/.ssh/id_rsa ~/.ssh/id_ed25519 /dev/null
end

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
set --export PATH (go env GOPATH)/bin $PATH

set -x LANG en_US.UTF-8
set -x LC_CTYPE en_US.UTF-8
