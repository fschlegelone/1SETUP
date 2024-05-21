#!/opt/homebrew/bin/zsh
# -- STATUS REPORT -- #
filename=$(basename "$0")
echo -e "${I_OK}$filename"

# -- SYSTEM VARIABLES -- #
export EDITOR="nvim"
export VISUAL="nvim"
export BROWSER="firefox"
export HOSTNAME="mac-one"
# -- XDG VARIABLES -- #
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

# -- CUSTOM DIRECTORY VARIABLES -- #
export NAS_DIR="$HOME/nas"
export DEV_DIR="/opt/dev"
export GITHUB_DIR="$HOME/github"
export NOTES_DIR="$NAS/notes"

export CRYPT_DIR="$XDG_CONFIG_HOME/crypt" # can be pushed to git
export CRIT_DIR="$XDG_CONFIG_HOME/crit" # !NEVER! push to git TODO: function that forbids pushing CRIT to git
export APPSUP="$HOME/Library/Application Support"
export ONESETUP_DIR="$XDG_CONFIG_HOME/onesetup"

export ZSH_DIR="$XDG_CONFIG_HOME/zsh"
export BASH_DIR="$XDG_CONFIG_HOME/bash"

export VAULT_DIR="$CRIT_DIR/vault"
export ANSIBLE_VAULT_SECRET="$VAULT_DIR/ansible_vault_secret"

# -- NEOVIM -- # 
export NVIM_APPNAME="nvim"
export NVIM_LOG_FILE="$XDG_CONFIG_HOME/$NVIM_APPNAME/nvim.log"
export NVIMPAGER_NVIM="/opt/homebrew/bin/nvim"
export PAGER="nvimpager"

# -- COMPILER (C) -- #
export LDFLAGS="-L/opt/homebrew/opt/binutils/lib" # binutils
export LDFLAGS="$LDFLAGS -L/opt/homebrew/opt/llvm/lib/c++ -Wl,-rpath,/opt/homebrew/opt/llvm/lib/c++ -L/opt/homebrew/opt/llvm/lib" # llvm / clang
export CPPFLAGS="-I/opt/homebrew/opt/binutils/include" # binutils
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include:$CPPFLAGS" # llvm / clang

# DOTNET
export DOTNET_ROOT="/opt/homebrew/opt/dotnet/libexec"

# STARSHIP
export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/starship.toml"

# NODE / PNPM / YARN_PNP
export PNPM_HOME="$XDG_CONFIG_HOME/pnpm"

# PYTHON / PYENV / PIP / VIRTUAL ENV / POETRY
export PYENV_ROOT="$HOME/.pyenv"
export PYENV_VERSION="3.12.2"

# GPG / GNUPG
export GNUPGHOME="$CRIT_DIR/gnupg" # gnupg config directory
export GPG_TTY=$(tty) # fixes inappropriate ioctl for device error
