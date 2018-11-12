# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
)

#source $ZSH/oh-my-zsh.sh
source .oh-my-zsh/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
source ~/.zsh/antigen.zsh

# Load the oh-my-zsh's library
antigen use oh-my-zsh

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle git
antigen bundle pip
antigen theme cypher
antigen apply

# alias octave
alias octave='/usr/local/octave/3.8.0/bin/octave-3.8.0'

eval $(thefuck --alias)

# SSH Server
alias enablessh='sudo systemsetup -setremotelogin on'
alias disablessh='sudo systemsetup -setremotelogin off'

# Postgresql
alias postgrestart="pg_ctl -D /usr/local/var/postgres start"
alias postgrestop="pg_ctl -D /usr/local/var/postgres stop"
