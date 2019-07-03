export PATH=/usr/local/bin:$PATH
export EDITOR='nano';
export HISTSIZE='32768';
export HISTFILESIZE="${HISTSIZE}";
export HISTCONTROL='ignoreboth';
export LANG='en_GB.UTF-8';
export LC_ALL='en_GB.UTF-8';
export LESS_TERMCAP_md="${yellow}";
export MANPAGER='less -X';
export GREP_OPTIONS='--color=auto';
export SSH_KEY_PATH="~/.ssh/rsa_id"

NODE_REPL_HISTORY_FILE=~/.node_history;
NODE_REPL_HISTORY_SIZE='32768';
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Path to ZSH
export ZSH=$HOME/.oh-my-zsh

source $(brew --prefix)/share/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle gitfast
antigen bundle autoenv
antigen bundle docker
antigen bundle node
antigen bundle npm
antigen bundle yarn
antigen bundle brew
antigen bundle github
antigen bundle history
antigen bundle osx
antigen bundle pip
antigen bundle copydir
antigen bundle copyfile
antigen bundle cp
antigen bundle per-directory-history
antigen bundle heroku
antigen bundle command-not-found

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions

# Load the theme.
antigen theme custom/minimal

# Tell Antigen that you're done.
antigen apply

# Aliases
alias python3="/usr/local/bin/python3"
alias pip="/usr/local/bin/pip3"
alias python3="/usr/local/bin/python3"
alias python="python3"
alias pip3="/usr/local/bin/python3"
alias pip="pip3"

fpath=(/usr/local/share/zsh-completions $fpath)
