set -gx NVM_DIR "$HOME/.nvm"
if test -s "$NVM_DIR/nvm.sh"
    source "$NVM_DIR/nvm.sh"
end
if test -s "$NVM_DIR/bash_completion"
    source "$NVM_DIR/bash_completion"
end
