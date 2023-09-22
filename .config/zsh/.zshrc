# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Basic
PATH=$PATH:$HOME/.scripts
export EDITOR='nvim'
export BROWSER='firefox'
export MANPAGER='nvim +Man!'
export TERMINAL="st"
export PASSWORD_STORE_ENABLE_EXTENSIONS=true
#bindkey -v
#autoload -Uz compinit && compinit
#zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'

# Prompt
#PROMPT='%F{yellow}%1~%f %F{red}%f '
#neofetch


# Git right side prompt
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats '%F{yellow}(%b)%r%f'
zstyle ':vcs_info:*' enable git

# Aliases
alias ll='exa -lah'
alias v='nvim'
alias weather='curl wttr.in'
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias xin='sudo xbps-install'
alias xqr='xbps-query'
alias xrm='sudo xbps-remove'
alias tmat='tmux attach -t'
alias tmnw='tmux new -s'
alias tmkl='tmux kill-session -t'
alias tmll='tmux ls'
alias ..="cd .."
alias ..2="cd ../.."
alias ..3="cd ../../.."
alias ..4="cd ../../../.."

alias ..5="cd ../../../../.."
# Pomodoro
declare -A pomo_options
pomo_options["work"]="35"
pomo_options["break"]="10"

pomodoro () {
  if [ -n "$1" -a -n "${pomo_options["$1"]}" ]; then
    val=$1
    echo $val | lolcat

    if command -v termdown > /dev/null; then
      termdown ${pomo_options["$val"]}m
    elif command -v timer > /dev/null; then
      timer ${pomo_options["$val"]}m
    else
      echo "Neither termdown nor timer is installed on your system."
      return 1
    fi

    notify-send "'$val' session done"
    espeak -v en+f3 -p 60 -s 150 "'$val' session done"
  fi
}


alias wo="pomodoro 'work'"
alias br="pomodoro 'break'"


# Custom ffmpeg function to convert to VP9 webm
convert2vp9() {
    # If the third argument is given, use it as the quality level, otherwise default to 31.
    local quality=${3:-31}
    ffmpeg -i "$1" -c:v libvpx-vp9 -crf "$quality" -b:v 0 -an "$2"
}

alias cvp9=convert2vp9


# plugins
source ~/.config/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source ~/.config/zsh/plugins/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
