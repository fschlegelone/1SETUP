#!/opt/homebrew/bin/zsh
# -- STATUS REPORT -- #
filename=$(basename "$0") 

echo -e "${I_OK}$filename sourced"

# -- TERMINAL COLOR CODES -- #
export C_BLACK='\033[1;30m'
export C_RED='\033[1;31m'
export C_GREEN='\033[1;32m'
export C_YELLOW='\033[1;33m'
export C_BLUE='\033[1;34m'
export C_PURPLE='\033[1;35m'
export C_CYAN='\033[1;36m'
export C_WHITE='\033[1;37m'
export C_GRAY='\033[1;34m'
export C_RESET='\033[0m'
# -- HEX COLOR CODES -- #
# accent colors
export PINK="#f5c2e7"
export MAUVE="#cba6f7"
export RED="#f38ba8"
export MAROON="#eba0ac"
export PEACH="#fab387"
export YELLOW="#f9e2af"
export GREEN="#a6e3a1"
export TEAL="#94e2d5"
export BLUE="#89b4fa"
export LAVENDER="#b4befe"
# background
export BG1="#1e1e2e" # dark
export BG2="#181825" # ..
export BG3="#11111b" # ..
export L_BG1="#313244" # light
export L_BG2="#45475a" # ..
export L_BG3="#585b70" # ..
# foreground (text)
export FG1="#cdd6f4" # light
export FG2="#a6adc8" # ..
export D_FG1="#11111b" # dark
export D_FG2="#1e1e2e" # ..

# -- GLYPHS -- #
export G_BORDER="${C_BLACK}󰇜󰇜󰇜󰇜󰇜󰇜󰇜󰇜󰇜󰇜󰇜󰇜󰇜󰇜󰇜󰇜󰇜󰇜󰇜󰇜󰇜󰇜󰇜󰇜󰇜󰇜󰇜󰇜󰇜󰇜󰇜󰇜󰇜󰇜󰇜󰇜󰇜󰇜󰇜󰇜${C_RESET} "

# -- STATUS MESSAGES -- #
export I_OK="${C_BLACK}[${C_GREEN} OK ${C_BLACK}] ${C_RESET}" # completed successfully
export I_ERR="${C_BLACK}[${C_RED} ERR ${C_BLACK}] ${C_RESET}" # error
export I_SKIP="${C_BLACK}[${C_CYAN} SKIP ${C_BLACK}] ${C_RESET}" # skipped
export I_RUN="${C_BLACK}[${C_CYAN} RUN ${C_BLACK}] ${C_RESET}" # running
export I_DO="${C_BLACK}[${C_YELLOW} DO ${C_BLACK}] ${C_RESET}" # user action required
export I_ASK="${C_BLACK}[${C_BLUE}  ?  ${C_BLACK}] ${C_RESET}" # user prompt (ask)
export I_INFO="${C_BLACK}[${C_PURPLE}  i  ${C_BLACK}] ${C_RESET}" # information
