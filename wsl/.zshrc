# Zsh autocomplete
#source /home/ubuntu/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# The following lines were added by compinstall (commented out because of zsh-autocomplete-plugin)

zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' matcher-list ''
zstyle :compinstall filename '/home/luke/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=5000
setopt autocd beep nomatch
bindkey -e
# End of lines configured by zsh-newuser-install

PROMPT='%n %@ %B%3~%b %# '
#PROMPT='%(?.%F{green}√.%F{red}?%?)%f %B%F{240}%~%f%b %# '
ZSH_THEME=”random”

neofetch | lolcat

alias ls='ls --color=auto'
#alias cp='cp -g'
#alias mv='mv -g'
alias docco='docker-compose'


eval $(thefuck --alias)
#source ~/.bashrc

cd ~
