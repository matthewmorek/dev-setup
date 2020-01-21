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
antigen bundle node
antigen bundle npm
antigen bundle brew
antigen bundle github
antigen bundle history
antigen bundle osx
antigen bundle copydir
antigen bundle copyfile
antigen bundle cp
antigen bundle per-directory-history
antigen bundle command-not-found

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions

# Load the theme.
antigen theme custom/minimal

# Tell Antigen that you're done.
antigen apply

# Custom user settings
export PATH=/usr/local/opt/python/libexec/bin:$PATH

if [ "$TERM" = "xterm-256color" ] && [ -z "$INSIDE_EMACS" ]; then
    [ -f "~/.iterm2_shell_integration.zsh" ] && source ~/.iterm2_shell_integration.zsh
fi

export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).

export LDFLAGS="-L/usr/local/opt/bison/lib"
export PATH="/usr/local/opt/flex/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/flex/lib"
export CPPFLAGS="-I/usr/local/opt/flex/include"
export PATH="/usr/local/opt/openssl/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/openssl/lib"
export CPPFLAGS="-I/usr/local/opt/openssl/include"

export PATH="/usr/local/sbin:$PATH"
export GPG_TTY=$(tty)

alias bt-reset="blueutil --power 0; sleep 1; blueutil --power 1"
