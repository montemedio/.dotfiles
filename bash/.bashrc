set -o vi
bind -m vi-insert "\C-l":clear-screen

alias o="fileopen"
alias n="filenew"

alias us="uebsync-notify"
alias uo="uebopen"
alias uc=". uebcd"

alias v="nvim"
alias vim="nvim"

alias ci="cat /home/lukas/Dokumente/Milchenbach/2019/Film/ChunkInfo.txt | fzf"

alias fzf="fzf --color 16"

if [ -r /vol/local/etc/startup/profile ]; then
	. /vol/local/etc/startup/profile
fi

export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent

for d in $HOME/.bin/*/; do PATH="$PATH:$d"; done
