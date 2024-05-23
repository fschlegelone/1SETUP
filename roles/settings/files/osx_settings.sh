#-- DOCK --#
set_dock() {
  defaults write com.apple.dock "tilesize" -int "50" # dock size
  defaults write com.apple.dock "orientation" -string "bottom" # dock orientation
  defaults write com.apple.dock "show-recents" -bool "false" # dont show recent apps
  defaults write com.apple.dock "autohide" -bool "true" # enable autohide dock
  defaults write com.apple.dock "autohide-time-modifier" -float "1" # autohide speed
  defaults write com.apple.dock "autohide-delay" -float "0.1" # autohide delay
  defaults write com.apple.dock "mineffect" -string "suck" # window minimize effect 
}

#-- FINDER --#
set_finder() {

  # TODO: favorite directories
  defaults write NSGlobalDomain "AppleShowAllExtensions" -bool "true" # show file extensions
  defaults write com.apple.finder "ShowPathbar" -bool "true" # show pathbar
  defaults write com.apple.finder "FXPreferredViewStyle" -string "Nlsv" # default view
  defaults write com.apple.finder "_FXSortFoldersFirst" -bool "true" # show directories on top
  defaults write com.apple.finder "FXDefaultSearchScope" -string "SCsp" # search scope 
  defaults write com.apple.finder "FXRemoveOldTrashItems" -bool "true" # empty bin every 30days
  defaults write NSGlobalDomain "NSDocumentSaveNewDocumentsToCloud" -bool "false" # default document save (icloud/disk)
}

#-- KEYBOARD --#
set_keyboard() {
  defaults write -g ApplePressAndHoldEnabled -bool false # disable press and hold for special characters 
  # key repeat rate (1-20)
  defaults write -g InitialKeyRepeat -int 20
  defaults write -g KeyRepeat -int 2
}


set_others() {
  #-- OTHER --#
  defaults write -g com.apple.swipescrolldirection -bool false # natural scrolling
  defaults write -g com.apple.keyboard.fnState -bool true # use standard function keys (f1,f2..)
  sudo nvram StartupMute=%01 # disable startup sound
}

#-- KEYMAPS --#
export_keymaps() {
  defaults export com.apple.symbolichotkeys - >"$ROOT_DIR/options/keymaps.plist"
  printf "${I_SUCCESS} Keymaps exported to $ROOT_DIR/options/keymaps.plist \n"
}
#-- WALLPAPER --#
set_wallpaper() {
  wallpaper_src="$root_dir/wallpaper"
  wallpaper_dest="$HOME/Pictures"
  wallpaper_selected="$(gum file $wallpaper_src)" 
  extension="${wallpaper_selected##*.}"
  cp "$wallpaper_selected" "$wallpaper_dest/wallpaper.$extension"
  wallpaper_path="$HOME/Pictures/wallpaper.$extension"
  osascript -e "tell application \"Finder\" to set desktop picture to POSIX file \"$wallpaper_path\""
  printf "${I_INFO} Completed setting wallpaper \n"
}

apply_settings(){
  killall Dock
  killall Finder
  killall SystemUIServer
  printf "${I_INFO} Completed applying settings \n"
}

check_setting() {
  domain=$1
  key=$2
  expected_value=$3
  actual_value=$(defaults read "$domain" "$key" 2>/dev/null)
  if [[ "$actual_value" == "$expected_value" ]]; then
      printf "${I_SUCCESS} $key has been set \n"
  else
      printf "${I_ERROR} $key has not been set. Please check. \n"
  fi
}

check_settings() {
  check_setting "com.apple.dock" "tilesize" "50"
  check_setting "com.apple.dock" "orientation" "bottom"
  check_setting "com.apple.dock" "show-recents" "false"
  check_setting "com.apple.dock" "autohide" "true"
  check_setting "com.apple.dock" "autohide-time-modifier" "1"
  check_setting "com.apple.dock" "autohide-delay" "0.1"
  check_setting "com.apple.dock" "mineffect" "suck"
  check_setting "NSGlobalDomain" "AppleShowAllExtensions" "true"
  check_setting "com.apple.finder" "ShowPathbar" "true"
  check_setting "com.apple.finder" "FXPreferredViewStyle" "Nlsv"
  check_setting "com.apple.finder" "_FXSortFoldersFirst" "true"
  check_setting "com.apple.finder" "FXDefaultSearchScope" "SCsp"
  check_setting "com.apple.finder" "FXRemoveOldTrashItems" "true"
  check_setting "NSGlobalDomain" "NSDocumentSaveNewDocumentsToCloud" "false"
  check_setting "-g" "ApplePressAndHoldEnabled" "false"
  check_setting "-g" "InitialKeyRepeat" "5"
  check_setting "-g" "KeyRepeat" "5"
  check_setting "-g" "com.apple.swipescrolldirection" "false"
  check_setting "-g" "com.apple.keyboard.fnState" "true"
  printf "${I_INFO} Completed checking settings \n"
}

# FUNCTION CALLS
printf "${I_ASK_YN} Export keymaps from system settings & overwrite plist? \n"
read usr_export_keymaps
if [[ $usr_export_keymaps == "y" ]]; then
  export_keymaps # execute export_keymaps function
fi
defaults import com.apple.symbolichotkeys "$ROOT_DIR/options/keymaps.plist"
printf "${I_SUCCESS} Applied keyboard shortcuts from ${C_CYAN}keymaps.plist\n${C_RESET}"
printf "${I_ASK_YN} Set wallpaper? \n"
read usr_setwallpaper
if [[ $usr_setwallpaper == "y" ]]; then
  set_wallpaper # execute set_wallpaper function
fi

set_dock 
set_finder
set_keyboard
set_others
apply_settings # execute apply_settings function
check_settings # execute check_settings function
