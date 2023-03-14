# ====== Exports ======
export ZSH=~/.oh-my-zsh

# Set Local Bin Path
export LOCALBINPATH="$HOME/.local"
PATH="$LOCALBINPATH/bin:$PATH"

# Set Golang Path
export GOPATH="$HOME/.go"
PATH="$GOPATH/bin:$PATH"

# Set Rust Path
export RUSTPATH="$HOME/.cargo"
PATH="$RUSTPATH/bin:$PATH"

# Environment Variables
# aws cli config
export AWS_ACCESS_KEY_ID=$(aws configure get aws_access_key_id)
export AWS_SECRET_ACCESS_KEY=$(aws configure get aws_secret_access_key)


# ====== UI ======
# set "random" to load themes randomly
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )
ZSH_THEME="jnrowe"


# ====== Sources/Zsh Plugins ======
source $ZSH/oh-my-zsh.sh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.z.sh

plugins=(
    git
)


# ====== Aliases ======
# Tmux unicode fix on alacritty
alias tmux='tmux -u'

alias vf='nvim $(fzf)'
alias nv='nvim'
alias ls='exa -F'
alias cat='batcat'
alias history='history -t "%d/%m/%Y 🔸"'
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'


# ====== External Tools ======
# Fuzzy Finder
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'


# ====== Startup Commands ======
# Start Tmux on shell load
# if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
#   exec tmux -u
# fi


# ====== ZSH Options ======
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"


# ====== User configuration ======
# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Hide username@hostname
USER=``

# Setup Virtual Golang
# command -v vg >/dev/null 2>&1 && eval "$(vg eval --shell zsh)"
