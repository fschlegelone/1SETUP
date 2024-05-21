#!/opt/homebrew/bin/zsh
# -- STATUS REPORT -- #
filename=$(basename "$0")
echo -e "${I_OK}$filename sourced"

# -- PATH -- #
# gnu coreutils
export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
# gnu grep
export PATH="/opt/homebrew/opt/grep/libexec/gnubin:$PATH"
# gnu sed
export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"
# gnu awk
export PATH="/opt/homebrew/opt/gawk/libexec/gnubin:$PATH"
# gnu tar
export PATH="/opt/homebrew/opt/gnu-tar/libexec/gnubin:$PATH"
# llvm / clang
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #
