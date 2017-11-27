export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"

setopt prompt_subst

local C0=$'%{\e[00;32m%}'
local C1=$'%{\e[00;36m%}'
local C2=$'%{\e[00;39m%}'
PROMPT="$C0%~
$C2$ "

PROMPT2="%B%_>%b "
SPROMPT="%r is correct? [n,y,a,e]: "
RPROMPT=""

bindkey -e

autoload -U compinit
compinit

setopt auto_cd
setopt auto_menu
setopt correct
setopt list_types
setopt print_eight_bit
eval `dircolors`
zstyle ':completion:*:default' list-colors ${LS_COLORS}

setopt complete_aliases
alias ls='ls --color=auto'
alias h='history -E -32'
alias cp='cp -i'
alias ll='ls -laF --color'
alias l='less'
alias m='make'
alias gpp='g++'
alias gcc='gcc -Wall -O2 -std=c99'
alias a='./a.out'
alias g='git'
alias gf='git flow'
alias gs='git status -s -b'
alias gb='git branch --color'
alias gco='git checkout'
alias ga='git add'
alias gl='git log --decorate'
alias gci='git commit -v'
alias gst='git stash'
alias gpul='git pull'
alias gpsh='git push'
alias gdif='git diff'
alias gg='git grep'
alias grb='git rebase'
alias gbr='git branch'

HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt share_history
setopt append_history
setopt inc_append_history
setopt hist_no_store
setopt hist_reduce_blanks
setopt hist_ignore_space
setopt auto_pushd
setopt pushd_ignore_dups

autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[OA" history-beginning-search-backward-end
bindkey "^[OB" history-beginning-search-forward-end
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end

bindkey "^R" history-incremental-search-backward
bindkey "^S" history-incremental-search-forward

function history-all { history -E 1 }

case "${TERM}" in
kterm*|xterm)
    precmd() {
        echo -ne "\033]0;${USER}@${HOST}\007"
    }
    ;;
    esac
