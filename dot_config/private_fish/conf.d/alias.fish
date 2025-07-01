# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# my custom
alias ls="eza -lg --icons --group-directories-first"
alias dt="date '+%m/%d/%Y %H:%M:%S'"
# alias lf="lfub"
alias cat="bat --style plain --paging never"
# alias bat="bat -un"
alias mip='curl icanhazip.com'
alias mpip='proxychains curl icanhazip.com'
alias march='sudo reflector --save /etc/pacman.d/mirrorlist --country Netherlands,France,Iran --sort rate'
alias smmain='sshfs main: ~/.remotes/main'
alias sumain='fusermount -u ~/.remotes/main'
alias ipt='sudo iptables -L -n -v --line-numbers'
alias ip='ip -br -c'
alias ssha='ssh-add'
alias sshd='ssh-add -d'
alias otp='pass otp -c'
alias rsync="rsync --exclude='.git/'"
alias drsync="rsync --exclude='.git/' --delete"
alias byee="poweroff"
alias code="code --ozone-platform=wayland"
alias sway="/home/ali/.config/sway/scripts/start.sh"

alias cliniqai_server='sshpass -p "49aZ03cMheLuCcaZaAYk" ssh root@91.107.177.56'
alias cliniqai_server_test_root='sshpass -p "b7pxQbD9mPFDdq42iKqqMDG6pkcM4e7qCKZ9tzZ7ZruhyXVdMEWKUHRZjqK2iJD3tvbtpiFN95Z7e5gk8yCtxLBQWY" ssh root@65.109.212.36'
alias cliniqai_server_test='sshpass -p "TgM7PVUshCsc7tDASTrSz8KT5n8ePJBicbAVinifpjJeKigbgoWhgsCeDpUHpim66YLrS7VJkGumZXFgLsWbXZm6gZ" ssh cliniqai@65.109.212.36'
alias alfa_server='sshpass -p "dFHY4VfbCWBUWEqNrBDf" ssh root@91.107.166.122'
