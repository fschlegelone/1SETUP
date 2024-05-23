defaults write -g NSWindowShouldDragOnGesture YES

# remove from quarantine
xattr -d com.apple.quarantine "/Applications/AppName.app"
