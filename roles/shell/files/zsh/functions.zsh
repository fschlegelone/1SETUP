#!/opt/homebrew/bin/zsh
# -- STATUS REPORT -- #
filename=$(basename "$0")
echo -e "${I_OK}$filename sourced"

# screenshot from cli
ss() {
    # Define the screenshots directory
    SCREENSHOTS_DIR="$HOME/nas/gallery/screenshots" 
    # Define filename
    timestamp=$(date +"%Y_%m-%R") # get timestamp (YY/MM-hh/mm)
    filename="osx_screencapture_${timestamp}.png"
    # Take screenshot
    screencapture "${SCREENSHOTS_DIR}/$filename"
    print "${I_OK}Screenshot saved to ~/nas/gallery/screenshots/$filename"
}

# get file permission info
chinfo() {
  echo -e "${C_GREEN}$1${C_RESET}"
  echo -e "permissions: $(stat -c '%a' "$1")\nownership: $(stat -c '%U:%G' "$1")"
}

ppath() {
  printf "${G_BORDER}${C_CYAN}            INCLUDED IN PATH${G_BORDER}"
  IFS=':' read -r -d '' path_array <<< "$PATH:"
  printf "${I_INFO} %s \n" "${(ps/:/)path_array}"
}

# update homebrew
brewup(){
  # Update homebrew
  printf "${C_TEXT}Updating Homebrew...\n"
  brew update
  # Update formulaes and casks
  printf "${C_TEXT}Upgrading homebrew formulaes and casks...\n"
  # Cleanup cache of unfinished downloads
  printf "${C_TEXT}Cleaning up homebrew cache...\n"
  brew cleanup
  # Show problems if any
  printf "${C_TEXT}Checking for homebrew issues...\n"
  brew doctor
}

# update python, pip, poetry
pyup(){
  # update global pip packages
  pip install --upgrade $(pip list --user | awk '{print $1}')
}

# run all update functions
up(){
  brewup
  pyup
}
