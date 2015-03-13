# Ayup
export EDITOR=vim
export BROWSER=$(which google-chrome chromium-browser firefox links2 links lynx | grep -Pm1 '^/')
export TZ=America/New_York
export GPG_TTY=`tty`

# Yes, really
export PATH=$PATH:~/.bin
export PATH=$PATH:/sbin:/usr/sbin

# Constantly needing this
autoload -U zcalc

# Aliases
which links2 >/dev/null   && alias links=links2
which htop >/dev/null     && alias top=htop
which ack-grep >/dev/null && alias ack=ack-grep
which mosh >/dev/null     && alias mosh='mosh -a'

alias info='info --vi-keys'

# Useful things
alias drop-caches='echo 3 | sudo tee /proc/sys/vm/drop_caches'

tailf() { tail -f $2 | while read j; do print -n "\n$j"; done }
mkcd() { mkdir -p $@; cd $_ }

ing() {
	local host=$1
	ping $1 | while read line; do
		[[ $line -pcre-match 'time=(\d+\.?\d* ms)' ]] &&
			print -n "\n$host: $MATCH[1]" #"\n$1: $(grep -Po '\d+\.?\d* ms' <<< $j)"
	done
}

# Bleck.  These shouldn't be at the end of the file.
export PATH=$PATH:$HOME/.rvm/bin
export PATH=/usr/local/heroku/bin:$PATH
[[ -f ~/.travis/travis.sh ]] && source ~/.travis/travis.sh

# Autocompletion for various things
which grunt >/dev/null    && eval "$(grunt --completion=zsh)"

# default bindings for zsh-users/zsh-history-substring-search
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# For historical purposes
HISTSIZE=10000
SAVEHIST=8500

# Oh My ZSH!
ZSH_THEME="rummik"
COMPLETION_WAITING_DOTS="true"

[[ ! -f ~/.zshenv || -z $(grep DEBIAN_PREVENT_KEYBOARD_CHANGES ~/.zshenv) ]] &&
	print "DEBIAN_PREVENT_KEYBOARD_CHANGES=yes" >> ~/.zshenv

# Antigen <3
[[ ! -d ~/.lib/antigen ]] &&
	mkdir -p ~/.lib && git clone https://github.com/zsh-users/antigen.git ~/.lib/antigen

. ~/.lib/antigen/antigen.zsh

antigen use oh-my-zsh
antigen theme rummik/zsh-theme

antigen bundles <<EOBUNDLES
rummik/zsh-isup
#rummik/zsh-blog
rummik/zsh-dotty
rummik/zsh-adminer
rummik/zsh-unrpm
rummik/zsh-psmin
rummik/zsh-stt
rummik/zsh-pyhttp
rummik/zsh-dokku
rummik/patpat
rummik/9k1.us

#sprunge
#wakeonlan
#nyan

#git
#github
#npm
#heroku
#screen
#vundle

#debian

zsh-users/zsh-syntax-highlighting
zsh-users/zsh-history-substring-search
EOBUNDLES

antigen apply

setopt nocorrectall

dotty remote rummik/dotfiles

# Source user's zshrc
[[ -f ~/.zsh_userrc ]] && . ~/.zsh_userrc

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
