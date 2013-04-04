# Ayup
export PATH=$PATH:~/.bin
export EDITOR=vim
export BROWSER=$(which google-chrome chromium-browser firefox links2 links lynx | grep -Pm1 '^/')

which links2 >/dev/null   && alias links=links2
which htop >/dev/null     && alias top=htop
which ack-grep >/dev/null && alias ack=ack-grep
which mosh >/dev/null     && alias mosh='mosh -a'

tailf() { tail -f $2 | while read j; do print -n "\n$j"; done }

# For historical purposes
HISTSIZE=10000
SAVEHIST=8500

# Oh My ZSH!
ZSH_THEME="rummik"
COMPLETION_WAITING_DOTS="true"

# Antigen <3
[[ ! -d ~/.lib/antigen ]] && \
	mkdir -p ~/.lib && git clone https://github.com/zsh-users/antigen.git ~/.lib/antigen

. ~/.lib/antigen/antigen.zsh

antigen lib
antigen theme rummik/zsh-theme

antigen bundles <<EOBUNDLES
rummik/zsh-isup
rummik/zsh-blog

sprunge
wakeonlan
nyan

git
github
npm
heroku
screen

debian

zsh-users/zsh-syntax-highlighting
EOBUNDLES

antigen apply

[[ -f ~/.zsh_userrc ]] && . ~/.zsh_userrc
