# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Basic
PATH=$PATH:$HOME/.scripts
export editor='nvim'
export BROWSER='firefox'
export MANPAGER='nvim +Man!'
export PATH=~/.local/bin:$PATH #PTSH
export TERM="xterm-256color"
#bindkey -v
#autoload -Uz compinit && compinit
#zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'

# Prompt
#PROMPT='%F{yellow}%1~%f %F{red}%f '

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

# plugins
source ~/.config/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source ~/.config/zsh/plugins/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
