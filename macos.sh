#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &


# see:
#  - https://github.com/joeyhoer/starter/tree/master/system
#  - https://github.com/ymendel/dotfiles/tree/master/osx
#  - https://github.com/veteranmina/Mac-Scripts/blob/master/DisableFingerSwipe.sh
#  - https://jamfnation.jamfsoftware.com/discussion.html?id=6994


###############################################################################
#                                                                             #
# App: System Preferences                                                     #
#                                                                             #
###############################################################################

# 1. General
defaults write NSGlobalDomain AppleInterfaceStyle -string "Dark"             # set dark menu bar and dock
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 1              # set sidebar icon size to small
defaults write NSGlobalDomain AppleShowScrollBars -string "WhenScrolling"    # set scrollbars to show when scrolling
defaults write NSGlobalDomain AppleScrollerPagingBehavior -int 0             # set scrollbar click to paging
defaults write NSGlobalDomain AppleFontSmoothing -int 2                      # lcd font smoothing enabled by default


# 2. Desktop & Screen Saver
defaults write com.apple.screensaver idleTime -int 0                   # never show screensaver
defaults write com.apple.screensaver loginWindowIdleTime -int 0        # never show screensaver at login screen

# 3. Dock
defaults write com.apple.dock tilesize -int 28                                   # set dock item pixel size
defaults write com.apple.dock magnification -bool true                           # enable dock magnification
defaults write com.apple.dock largesize -float 36.0                              # set dock magnification size
defaults write com.apple.dock orientation -string "left"                         # move dock to the left side
defaults write com.apple.dock mineffect -string "scale"                          # set window minimization to scale effect
defaults write NSGlobalDomain AppleWindowTabbingMode -string "manual"            # manually open documents in tabs
defaults write com.apple.dock minimize-to-application -bool true                 # minimize windows into application icon
defaults write NSGlobalDomain AppleMiniaturizeOnDoubleClick -bool false          # do not minimize or maximize on clicking title bar
defaults write NSGlobalDomain AppleActionOnDoubleClick -string "None"
defaults write com.apple.dock autohide -bool true                                # autohide the dock
defaults write com.apple.dock show-process-indicators -bool true                 # show indicator lights for open applications
defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true # (extra) string loading for all dock items
defaults write com.apple.dock mouse-over-hilite-stack -bool true                 # (extra) highlight hover effect for the grid view of a stack
defaults write com.apple.dock showhidden -bool true                              # (extra) set dock icons of hidden app translucent

# 4. Mission Control
defaults write com.apple.dock mru-spaces -bool false                   # do not rearrange spaces
defaults write NSGlobalDomain AppleSpacesSwitchOnActivate -bool false  # do not switch spaces when switching apps
defaults write com.apple.dock expose-group-by-app -bool true           # mission control group window by app
defaults write com.apple.spaces spans-displays -bool false             # displays have separate spaces
defaults write com.apple.dashboard mcx-disabled -bool true             # disable dashboard
defaults write com.apple.dashboard enabled-state -int 1                # turn dashboard off
defaults write com.apple.dock dashboard-in-overlay -bool true          # don't show dashboard as a space
defaults write com.apple.dock wvous-tl-corner -int 0                   # disable top left screen hot corner
defaults write com.apple.dock wvous-tl-modifier -int 0
defaults write com.apple.dock wvous-tr-corner -int 0                   # disable top right screen corner
defaults write com.apple.dock wvous-tr-modifier -int 0
defaults write com.apple.dock wvous-bl-corner -int 0                   # disable bottom left screen corner
defaults write com.apple.dock wvous-bl-modifier -int 0
defaults write com.apple.dock wvous-br-corner -int 0                   # disable bottom right screen corner
defaults write com.apple.dock wvous-br-modifier -int 0
defaults write com.apple.dock workspaces-auto-swoosh -bool false       # (extra) do not switch spaces when apps open

# 5. Language & Region
defaults write NSGlobalDomain AppleLanguages -array "en" "zh-Hans"  # perferred languages
defaults write NSGlobalDomain AppleLocale -string "en_US"           # region
defaults write NSGlobalDomain AppleICUForce24HourTime -bool true
# advanced -- general
defaults write NSGlobalDomain AppleMetricUnits -bool true           # measuring unit = metric
defaults write NSGlobalDomain AppleMeasurementUnits -string "Centimeters"
defaults write NSGlobalDomain AppleICUNumberSymbols -dict-add "<dict><key>1</key><string> </string><key>17</key><string> </string></dict>"
# advanced -- dates
defaults write NSGlobalDomain AppleICUDateFormatStrings -dict-add "<dict><key>1</key><string>dMMMMMyy</string><key>2</key><string>d MMM yy</string><key>3</key><string>dd MMMM y</string><key>4</key><string>EEEE - dd MMMM y</string></dict>"
# advanced -- times
defaults write NSGlobalDomain AppleICUTimeFormatStrings -dict-add "<dict><key>4</key><string>HH:mm:ss zzzz (ZZZZ)</string></dict>"

# 6. Security & Privacy
# general
defaults write com.apple.screensaver askForPassword -bool true    # require password after sleep
defaults write com.apple.screensaver askForPasswordDelay -int 60  # delay by 60 seconds
sudo spctl --master-disable                                       # allow applications downloaded from anywhere
defaults write com.apple.LaunchServices LSQuarantine -bool false  # (extra) disable the “Are you sure you want to open this application?” dialog
# filevault -- do it manually
# firewall
defaults write /Library/Preferences/com.apple.alf globalstate -bool false
# privacy -- todo

# 7. Spotlight
defaults write com.apple.spotlight orderedItems -array \
	'{"enabled" = 1;"name" = "APPLICATIONS";}' \
	'{"enabled" = 1;"name" = "SYSTEM_PREFS";}' \
	'{"enabled" = 1;"name" = "DIRECTORIES";}' \
	'{"enabled" = 1;"name" = "CONTACT";}' \
	'{"enabled" = 1;"name" = "MENU_CONVERSION";}' \
	'{"enabled" = 1;"name" = "MENU_EXPRESSION";}' \
	'{"enabled" = 1;"name" = "MENU_DEFINITION";}' \
	'{"enabled" = 0;"name" = "DOCUMENTS";}' \
	'{"enabled" = 0;"name" = "PDF";}' \
	'{"enabled" = 0;"name" = "FONTS";}' \
	'{"enabled" = 0;"name" = "MESSAGES";}' \
	'{"enabled" = 0;"name" = "EVENT_TODO";}' \
	'{"enabled" = 0;"name" = "IMAGES";}' \
	'{"enabled" = 0;"name" = "BOOKMARKS";}' \
	'{"enabled" = 0;"name" = "MUSIC";}' \
	'{"enabled" = 0;"name" = "MOVIES";}' \
	'{"enabled" = 0;"name" = "PRESENTATIONS";}' \
	'{"enabled" = 0;"name" = "SPREADSHEETS";}' \
	'{"enabled" = 0;"name" = "SOURCE";}' \
	'{"enabled" = 0;"name" = "MENU_OTHER";}' \
	'{"enabled" = 0;"name" = "MENU_WEBSEARCH";}' \
	'{"enabled" = 0;"name" = "MENU_SPOTLIGHT_SUGGESTIONS";}'
defaults write com.apple.Spotlight useCount 5 # (extra) stop spotlight onboarding
chmod 600 /System/Library/CoreServices/Search.bundle/Contents/MacOS/Search # (extra) hide Spotlight tray-icon (and subsequent helper)
defaults write /.Spotlight-V100/VolumeConfiguration Exclusions -array "/Volumes" # (extra) disable spotlight index on volumes
# spotlight clean up
killall mds > /dev/null 2>&1     # Load new settings before rebuilding the index
mdutil -i on / > /dev/null  # Make sure indexing is enabled for the main volume
mdutil -E / > /dev/null     # Rebuild the index from scratch

# 8. Notifications -- TODO

# 9. Displays
defaults write com.apple.BezelServices dAuto -bool false                     # automatically adjust display brightness
defaults write /Library/Preferences/com.apple.iokit.AmbientLightSensor "Automatic Display Enabled" -bool false
defaults write com.apple.airplay showInMenuBarIfPresent -bool false          # show mirroring options in the menu bar when avaliable
defaults write com.apple.screencapture location -string "${HOME}/Desktop"    # (extra) save screenshots to the desktop
defaults write com.apple.screencapture type -string "png"      	             # (extra) save screenshots in PNG format
defaults write com.apple.screencapture disable-shadow -bool true             # (extra) disable shadow in screenshots
defaults write /Library/Preferences/com.apple.windowserver DisplayResolutionEnabled -bool true # (extra) enable HiDPI display modes (requires restart)

# 10. Energy Saver
IS_LAPTOP=`/usr/sbin/system_profiler SPHardwareDataType 2>/dev/null | grep "Model Identifier" | grep "Book"`
if [[ "$IS_LAPTOP" != "" ]]; then
    # notebook on battery
    sudo pmset -b sleep 90 disksleep 90 displaysleep 45 halfdim 0 powernap 1
    # notebook on power Adapter
    sudo pmset -c sleep 0 disksleep 0 displaysleep 0 halfdim 0 autorestart 1 womp 0 powernap 1
else
    # desktop
    sudo pmset sleep 0 disksleep 0 displaysleep 30 halfdim 0
fi
sudo pmset -a lessbright 0                              # disable dim display on battery
sudo systemsetup -setcomputersleep Never > /dev/null    #
sudo pmset -a hibernatemode 0                           # (extra) disable hibernation (speeds up entering sleep mode)
sudo pmset -a standbydelay 86400                        # (extra) set standby delay to 24 hours (default is 1 hour)
sudo pmset -a standby 0                                 #
sudo pmset -a autopoweroff 0                            #
sudo pmset -a sms 0                                     # (extra) disable the sudden motion sensor as it’s not useful for SSDs

# 11. Keyboard -- TODO
# keyboard
# text
# shortcuts
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 52 "<dict><key>enabled</key><false/><key>value</key><dict><key>type</key><string>standard</string><key>parameters</key><array><integer>65535</integer><integer>65535</integer><integer>0</integer></array></dict></dict>"    # disable Turn Dock Hidding On/Off - none
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 160 "<dict><key>enabled</key><false/><key>value</key><dict><key>type</key><string>standard</string><key>parameters</key><array><integer>65535</integer><integer>65535</integer><integer>0</integer></array></dict></dict>"   # disable show launchpad - none
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 32 "<dict><key>enabled</key><true/><key>value</key><dict><key>type</key><string>standard</string><key>parameters</key><array><integer>65535</integer><integer>126</integer><integer>8650752</integer></array></dict></dict>" # enable mission control to - ⌃↑
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 163 "<dict><key>enabled</key><false/><key>value</key><dict><key>type</key><string>standard</string><key>parameters</key><array><integer>65535</integer><integer>65535</integer><integer>0</integer></array></dict></dict>"   # disable show notification center (none)
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add # disable turn do not disturb on/off (none)
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add # disable application windows (none)
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add # enable show desktop (⌃↓)
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add # disable show dashboard (none)
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add # enable mission control move left a space (⌃←)
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add # enable mission control move right a space (⌃→)
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add # enable switch to desktop 1 (⌃1)
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add # enable switch to desktop 1 (⌃2)
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add # disable change way tab moves focus (none)
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add # disable turn keyboard access on or off (none)
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add # disable move focus to the menu bar (none)
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add # disable move focus to Dock (none)
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add # disable move focus to active or next window (none)
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add # disable move focus to the window toolbar (none)
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add # disable move focus to the floating window (none)
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add # disable move focus to next window (none)
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add # disable move focus to the window drawer (none)
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add # disable move focus to status menus (none)
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add # enable save picture of screen as file (⇧⌘3)
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add # enable copy picture of screen to the clipboard (⌃⇧⌘3)
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add # enable save picture of screen as file (⇧⌘4)
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add # enable copy picture of screen to the clipboard (⌃⇧⌘4)
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add # disable capture full screen (none)
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add # disable capture screen using timer (none)
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add # disable capture selection from screen (none)
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add # disable take screenshot (none)
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add # disable imageoptimize (none)
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add # disable import image (none)
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add # disable set desktop picture (none)
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add # disable new email to address (none)
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add # disable new email with selection (none)
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add # disable activiy monitor (none)
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add # disable allocations & leaks (none)
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add # disable file activity (none)
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add # disable system trace (none)
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add # disable compare files (none)
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add # disable compare to master (none)
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add # disable create service (none)
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add # disable create workflow (none)
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add # disable get result of applescript (none)
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add # disable make new applescript (none)
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add # disable run as applescript (none)
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add # disable time profile active application (none)
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add # disable time profile app under mouse (none)
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add # disable time profile entire system (none)
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add # disable toggle instruments recording (none)
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add # disable open selected file in textedit (none)
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add # disable new terminal at folder (none)
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add # disable new terminal tab at folder (none)
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add # disable encode selected audio files (none)
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add # disable encode selected video files (none)
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add # disable folder actions setup... (none)
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add # disable open (none)
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add # disable reveal in finder (none)
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add # disable show info in finder (none)
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add # disable send file to bluetooth device (none)
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add # disable look up in dictionary (none)
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add # disable search with google (none)
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add # disable spotlight (none)
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add # disable add to itunes as spoken track (none)
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add # disable convert text to full width (none)
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add # disable convert text to half width (none)
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add # disable convert text to simplified chinese (none)
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add # disable conert text to traditional chinese (none)
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add # disable create collection from text (none)
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add # disable create font library from text (none)
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add # disable display font information (none)
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add # disable find in xcode (none)
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add # disable open quickly in xcode (none)
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add # disable make new sticky notes (none)
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add # disable new textedit window containing selection (none)
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add # disable open man page in terminal (none)
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add # disable search page index in terminal (none)
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add # disable perform selection as mysql query (none)
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add # disable show map (none)
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add # disable summarize (none)
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add # disable add to reading list (none)
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add # disable open url (none)
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add # disable unarchive to current folder (none)
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add # disable unarchive to desktop (none)
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add # disable unarchive to ... (none)
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add # enable show spotlight search (⌘Space)
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add # disable show finder search window (none)
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add # disable turn zoom on or off (none)
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add # disable turn image smoothing on or off
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add # disable zoom out
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add # disable zoom in
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add # disable turn focus following on or off
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add # disable increase constrast
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add # disable decrease constrast
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add # disable invert colors
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add # disable turn voiceover on or off
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add # disable show accessibility controls
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add # disable show help menu
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false # (extra) press-and-hold = key repeat
defaults write NSGlobalDomain KeyRepeat -float 0.000000000001 #  (extra) fast key repeat rate
defaults write NSGlobalDomain InitialKeyRepeat -int 10 # (extra) key repeat delay
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false # (extra) disable smart quotes
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false # (extra) disable smart dashes
defaults write NSGlobalDomain NSUserQuotesArray -array '"\""' '"\""' '"'\''"' '"'\''"' # (extra) set double and single quotes
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false # (extra) disable autocorrect spelling

# 12. Mouse -- TODO


# 13. Trackpad -- TODO
defaults write com.apple.AppleMultitouchTrackpad.plist Clicking -bool false
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool false                 # no tap to click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 0  # disable right-click via bottome right corner
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool false  # no tap to click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool false  # no tap to click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool false  # no tap to click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool false  # no tap to click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool false  # no tap to click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool false  # no tap to click

###############################################################################
# Trackpad, mouse, keyboard, Bluetooth accessories, and input                 #
###############################################################################

# Trackpad: enable tap to click for this user and for the login screen
defaults write com.apple.AppleMultitouchTrackpad.plist Clicking -bool false
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool false
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Trackpad: map bottom right corner to right-click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true
defaults -currentHost write NSGlobalDomain com.apple.trackpad.trackpadCornerClickBehavior -int 1
defaults -currentHost write NSGlobalDomain com.apple.trackpad.enableSecondaryClick -bool true

# Disable “natural” (Lion-style) scrolling
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# Increase sound quality for Bluetooth headphones/headsets
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

# Enable full keyboard access for all controls
# (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Follow the keyboard focus while zoomed in
defaults write com.apple.universalaccess closeViewZoomFollowsFocus -bool true

# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Stop iTunes from responding to the keyboard media keys
#launchctl unload -w /System/Library/LaunchAgents/com.apple.rcd.plist 2> /dev/null



# 14. Printers & Scanners -- TODO

# 15. Sound -- TODO

# 16. iCloud -- TODO

# 17. Internet Accounts -- TODO

# 18. Extensions -- TODO

# 19. Network -- TODO

# 20. Sharing -- TODO

# 21. Users & Groups -- TODO

# 22. Parental Controls -- TODO

# 23. App Store -- TODO

# 24. Dictation & Speech -- TODO

# 25. Date & Time -- TODO
# Set the timezone; see `sudo systemsetup -listtimezones` for other values
systemsetup -settimezone "Europe/Brussels" > /dev/null

# 26. Startup Disk -- TODO

# 27. Time Machine -- TODO

# 28. Accessibility -- TODO
# Use scroll gesture with the Ctrl (^) modifier key to zoom
defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true
defaults write com.apple.universalaccess HIDScrollZoomModifierMask -int 262144



###############################################################################
#                                                                             #
# App: Terminal                                                               #
#                                                                             #
###############################################################################
sudo open "./Default.terminal"
sleep 1  # wait a bit to make sure the theme is loaded
defaults write com.apple.Terminal "Default Window Settings" -string "Default"
defaults write com.apple.Terminal "Startup Window Settings" -string "Default"
defaults write com.apple.Terminal SecureKeyboardEntry -bool true
defaults write com.apple.Terminal StringEncodings -array "<integer>4</integer>"



###############################################################################
#                                                                             #
# App: Finder                                                                 #
#                                                                             #
###############################################################################


###############################################################################
#                                                                             #
# App: Safari                                                                 #
#                                                                             #
###############################################################################











# -----------------------------------------------------------------------------


# input sources
# dictation

###############################################################################
# General UI/UX                                                               #
###############################################################################

# Set computer name (as done via System Preferences → Sharing)
sudo scutil --set ComputerName "MacBook-Pro"
sudo scutil --set HostName "MacBook-Pro"
sudo scutil --set LocalHostName "MacBook-Pro"
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "MacBook-Pro"

# Disable the sound effects on boot
sudo nvram SystemAudioVolume=" "

# Disable transparency in the menu bar and elsewhere on Yosemite
defaults write com.apple.universalaccess reduceTransparency -bool false

# Menu bar: hide the Time Machine, Volume, and User icons
for domain in ~/Library/Preferences/ByHost/com.apple.systemuiserver.*; do
	defaults write "${domain}" dontAutoLoad -array \
		"/System/Library/CoreServices/Menu Extras/TimeMachine.menu" \
		"/System/Library/CoreServices/Menu Extras/Volume.menu" \
		"/System/Library/CoreServices/Menu Extras/User.menu"
done
defaults write com.apple.systemuiserver menuExtras -array \
	"/System/Library/CoreServices/Menu Extras/Bluetooth.menu" \
	"/System/Library/CoreServices/Menu Extras/AirPort.menu" \
	"/System/Library/CoreServices/Menu Extras/Battery.menu" \
	"/System/Library/CoreServices/Menu Extras/Clock.menu"

# Set highlight color to green
# defaults write NSGlobalDomain AppleHighlightColor -string "0.764700 0.976500 0.568600"

# Set sidebar icon size to medium
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 2


# Disable the over-the-top focus ring animation
defaults write NSGlobalDomain NSUseAnimatedFocusRing -bool false

# Disable smooth scrolling
# (Uncomment if you’re on an older Mac that messes up the animation)
#defaults write NSGlobalDomain NSScrollAnimationEnabled -bool false

# Increase window resize speed for Cocoa applications
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Remove duplicates in the “Open With” menu (also see `lscleanup` alias)
/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user

# Display ASCII control characters using caret notation in standard text views
# Try e.g. `cd /tmp; unidecode "\x{0000}" > cc.txt; open -e cc.txt`
defaults write NSGlobalDomain NSTextShowsControlCharacters -bool true

# Disable Resume system-wide
defaults write com.apple.systempreferences NSQuitAlwaysKeepsWindows -bool false

# Disable automatic termination of inactive apps
defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true

# Disable the crash reporter
#defaults write com.apple.CrashReporter DialogType -string "none"

# Set Help Viewer windows to non-floating mode
defaults write com.apple.helpviewer DevMode -bool true

# Fix for the ancient UTF-8 bug in QuickLook (https://mths.be/bbo)
# Commented out, as this is known to cause problems in various Adobe apps :(
# See https://github.com/mathiasbynens/dotfiles/issues/237
#echo "0x08000100:0" > ~/.CFUserTextEncoding

# Reveal IP address, hostname, OS version, etc. when clicking the clock
# in the login window
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

# Restart automatically if the computer freezes
sudo systemsetup -setrestartfreeze on

# Disable Notification Center and remove the menu bar icon
launchctl unload -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist 2> /dev/null

# Disable smart quotes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Disable smart dashes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Set a custom wallpaper image. `DefaultDesktop.jpg` is already a symlink, and
# all wallpapers are in `/Library/Desktop Pictures/`. The default is `Wave.jpg`.
#rm -rf ~/Library/Application Support/Dock/desktoppicture.db
#sudo rm -rf /System/Library/CoreServices/DefaultDesktop.jpg
#sudo ln -s /path/to/your/image /System/Library/CoreServices/DefaultDesktop.jpg

###############################################################################
# SSD-specific tweaks                                                         #
###############################################################################

# Remove the sleep image file to save disk space
sudo rm /private/var/vm/sleepimage
# Create a zero-byte file instead…
sudo touch /private/var/vm/sleepimage
# …and make sure it can’t be rewritten
sudo chflags uchg /private/var/vm/sleepimage


###############################################################################
# Finder                                                                      #
###############################################################################

# Finder: allow quitting via ⌘ + Q; doing so will also hide desktop icons
defaults write com.apple.finder QuitMenuItem -bool true

# Finder: disable window animations and Get Info animations
defaults write com.apple.finder DisableAllAnimations -bool true

# Set Desktop as the default location for new Finder windows
# For other paths, use `PfLo` and `file:///full/path/here/`
defaults write com.apple.finder NewWindowTarget -string "PfDe"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/Desktop/"

# Show icons for hard drives, servers, and removable media on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# Finder: show hidden files by default
#defaults write com.apple.finder AppleShowAllFiles -bool true

# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Finder: show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Finder: show path bar
defaults write com.apple.finder ShowPathbar -bool true

# Display full POSIX path as Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Enable spring loading for directories
defaults write NSGlobalDomain com.apple.springing.enabled -bool true

# Remove the spring loading delay for directories
defaults write NSGlobalDomain com.apple.springing.delay -float 0

# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Disable disk image verification
defaults write com.apple.frameworks.diskimages skip-verify -bool true
defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true

# Automatically open a new Finder window when a volume is mounted
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true

# Show item info near icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist

# Show item info to the right of the icons on the desktop
/usr/libexec/PlistBuddy -c "Set DesktopViewSettings:IconViewSettings:labelOnBottom false" ~/Library/Preferences/com.apple.finder.plist

# Enable snap-to-grid for icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

# Increase grid spacing for icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:gridSpacing 100" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:gridSpacing 100" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:gridSpacing 100" ~/Library/Preferences/com.apple.finder.plist

# Increase the size of icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:iconSize 80" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:iconSize 80" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:iconSize 80" ~/Library/Preferences/com.apple.finder.plist

# Use list view in all Finder windows by default
# Four-letter codes for the other view modes: `icnv`, `clmv`, `Flwv`
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Disable the warning before emptying the Trash
defaults write com.apple.finder WarnOnEmptyTrash -bool false

# Enable AirDrop over Ethernet and on unsupported Macs running Lion
defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true

# Enable the MacBook Air SuperDrive on any Mac
sudo nvram boot-args="mbasd=1"

# Show the ~/Library folder
chflags nohidden ~/Library

# Show the /Volumes folder
sudo chflags nohidden /Volumes

# Remove Dropbox’s green checkmark icons in Finder
file=/Applications/Dropbox.app/Contents/Resources/emblem-dropbox-uptodate.icns
[ -e "${file}" ] && mv -f "${file}" "${file}.bak"

# Expand the following File Info panes:
# “General”, “Open with”, and “Sharing & Permissions”
defaults write com.apple.finder FXInfoPanesExpanded -dict \
	General -bool true \
	OpenWith -bool true \
	Privileges -bool true

###############################################################################
# Dock, Dashboard, and hot corners                                            #
###############################################################################

# Enable highlight hover effect for the grid view of a stack (Dock)
defaults write com.apple.dock mouse-over-hilite-stack -bool true

# Set the icon size of Dock items to 36 pixels
defaults write com.apple.dock tilesize -int 36

# Change minimize/maximize window effect
defaults write com.apple.dock mineffect -string "scale"

# Minimize windows into their application’s icon
defaults write com.apple.dock minimize-to-application -bool true

# Enable spring loading for all Dock items
defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true

# Show indicator lights for open applications in the Dock
defaults write com.apple.dock show-process-indicators -bool true

# Wipe all (default) app icons from the Dock
# This is only really useful when setting up a new Mac, or if you don’t use
# the Dock to launch apps.
#defaults write com.apple.dock persistent-apps -array

# Show only open applications in the Dock
#defaults write com.apple.dock static-only -bool true

# Don’t animate opening applications from the Dock
defaults write com.apple.dock launchanim -bool false

# Speed up Mission Control animations
defaults write com.apple.dock expose-animation-duration -float 0.1

# Remove the auto-hiding Dock delay
defaults write com.apple.dock autohide-delay -float 0
# Remove the animation when hiding/showing the Dock
defaults write com.apple.dock autohide-time-modifier -float 0


# Disable the Launchpad gesture (pinch with thumb and three fingers)
#defaults write com.apple.dock showLaunchpadGestureEnabled -int 0

# Reset Launchpad, but keep the desktop wallpaper intact
find "${HOME}/Library/Application Support/Dock" -name "*-*.db" -maxdepth 1 -delete

# Add iOS & Watch Simulator to Launchpad
sudo ln -sf "/Applications/Xcode.app/Contents/Developer/Applications/Simulator.app" "/Applications/Simulator.app"
sudo ln -sf "/Applications/Xcode.app/Contents/Developer/Applications/Simulator (Watch).app" "/Applications/Simulator (Watch).app"

# Add a spacer to the left side of the Dock (where the applications are)
#defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type="spacer-tile";}'
# Add a spacer to the right side of the Dock (where the Trash is)
#defaults write com.apple.dock persistent-others -array-add '{tile-data={}; tile-type="spacer-tile";}'



###############################################################################
# Safari & WebKit                                                             #
###############################################################################

# Privacy: don’t send search queries to Apple
defaults write com.apple.Safari UniversalSearchEnabled -bool false
defaults write com.apple.Safari SuppressSearchSuggestions -bool true

# Press Tab to highlight each item on a web page
defaults write com.apple.Safari WebKitTabToLinksPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2TabsToLinks -bool true

# Show the full URL in the address bar (note: this still hides the scheme)
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true

# Set Safari’s home page to `about:blank` for faster loading
defaults write com.apple.Safari HomePage -string "about:blank"

# Prevent Safari from opening ‘safe’ files automatically after downloading
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false

# Allow hitting the Backspace key to go to the previous page in history
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2BackspaceKeyNavigationEnabled -bool true

# Hide Safari’s bookmarks bar by default
defaults write com.apple.Safari ShowFavoritesBar -bool false

# Hide Safari’s sidebar in Top Sites
defaults write com.apple.Safari ShowSidebarInTopSites -bool false

# Disable Safari’s thumbnail cache for History and Top Sites
defaults write com.apple.Safari DebugSnapshotsUpdatePolicy -int 2

# Enable Safari’s debug menu
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

# Make Safari’s search banners default to Contains instead of Starts With
defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false

# Remove useless icons from Safari’s bookmarks bar
defaults write com.apple.Safari ProxiesInBookmarksBar "()"

# Enable the Develop menu and the Web Inspector in Safari
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

# Add a context menu item for showing the Web Inspector in web views
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

# Enable continuous spellchecking
defaults write com.apple.Safari WebContinuousSpellCheckingEnabled -bool true
# Disable auto-correct
defaults write com.apple.Safari WebAutomaticSpellingCorrectionEnabled -bool false

# Disable AutoFill
defaults write com.apple.Safari AutoFillFromAddressBook -bool false
defaults write com.apple.Safari AutoFillPasswords -bool false
defaults write com.apple.Safari AutoFillCreditCardData -bool false
defaults write com.apple.Safari AutoFillMiscellaneousForms -bool false

# Warn about fraudulent websites
defaults write com.apple.Safari WarnAboutFraudulentWebsites -bool true

# Disable plug-ins
defaults write com.apple.Safari WebKitPluginsEnabled -bool false
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2PluginsEnabled -bool false

# Disable Java
defaults write com.apple.Safari WebKitJavaEnabled -bool false
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaEnabled -bool false

# Block pop-up windows
defaults write com.apple.Safari WebKitJavaScriptCanOpenWindowsAutomatically -bool false
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaScriptCanOpenWindowsAutomatically -bool false

# Enable “Do Not Track”
defaults write com.apple.Safari SendDoNotTrackHTTPHeader -bool true

# Update extensions automatically
defaults write com.apple.Safari InstallExtensionUpdatesAutomatically -bool true

###############################################################################
# Mail                                                                        #
###############################################################################

# Disable send and reply animations in Mail.app
defaults write com.apple.mail DisableReplyAnimations -bool true
defaults write com.apple.mail DisableSendAnimations -bool true

# Copy email addresses as `foo@example.com` instead of `Foo Bar <foo@example.com>` in Mail.app
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false

# Add the keyboard shortcut ⌘ + Enter to send an email in Mail.app
defaults write com.apple.mail NSUserKeyEquivalents -dict-add "Send" "@\U21a9"

# Display emails in threaded mode, sorted by date (oldest at the top)
defaults write com.apple.mail DraftsViewerAttributes -dict-add "DisplayInThreadedMode" -string "yes"
defaults write com.apple.mail DraftsViewerAttributes -dict-add "SortedDescending" -string "yes"
defaults write com.apple.mail DraftsViewerAttributes -dict-add "SortOrder" -string "received-date"

# Disable inline attachments (just show the icons)
defaults write com.apple.mail DisableInlineAttachmentViewing -bool true

# Disable automatic spell checking
defaults write com.apple.mail SpellCheckingBehavior -string "NoSpellCheckingEnabled"


# Enable “focus follows mouse” for Terminal.app and all X11 apps
# i.e. hover over a window and start typing in it without clicking first
#defaults write com.apple.terminal FocusFollowsMouse -bool true
#defaults write org.x.X11 wm_ffm -bool true

# Enable Secure Keyboard Entry in Terminal.app
# See: https://security.stackexchange.com/a/47786/8918
defaults write com.apple.terminal SecureKeyboardEntry -bool true

###############################################################################
# Time Machine                                                                #
###############################################################################

# Prevent Time Machine from prompting to use new hard drives as backup volume
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

# Disable local Time Machine backups
hash tmutil &> /dev/null && sudo tmutil disablelocal

###############################################################################
# Activity Monitor                                                            #
###############################################################################

# Show the main window when launching Activity Monitor
defaults write com.apple.ActivityMonitor OpenMainWindow -bool true

# Visualize CPU usage in the Activity Monitor Dock icon
defaults write com.apple.ActivityMonitor IconType -int 5

# Show all processes in Activity Monitor
defaults write com.apple.ActivityMonitor ShowCategory -int 0

# Sort Activity Monitor results by CPU usage
defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
defaults write com.apple.ActivityMonitor SortDirection -int 0

###############################################################################
# Address Book, Dashboard, iCal, TextEdit, and Disk Utility                   #
###############################################################################

# Enable the debug menu in Address Book
defaults write com.apple.addressbook ABShowDebugMenu -bool true

# Enable the debug menu in iCal (pre-10.8)
defaults write com.apple.iCal IncludeDebugMenu -bool true

# Use plain text mode for new TextEdit documents
defaults write com.apple.TextEdit RichText -int 0
# Open and save files as UTF-8 in TextEdit
defaults write com.apple.TextEdit PlainTextEncoding -int 4
defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4

# Enable the debug menu in Disk Utility
defaults write com.apple.DiskUtility DUDebugMenuEnabled -bool true
defaults write com.apple.DiskUtility advanced-image-options -bool true

# Auto-play videos when opened with QuickTime Player
defaults write com.apple.QuickTimePlayerX MGPlayMovieOnOpen -bool true

###############################################################################
# Mac App Store                                                               #
###############################################################################

# Enable the WebKit Developer Tools in the Mac App Store
defaults write com.apple.appstore WebKitDeveloperExtras -bool true

# Enable Debug Menu in the Mac App Store
defaults write com.apple.appstore ShowDebugMenu -bool true

# Enable the automatic update check
defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true

# Check for software updates daily, not just once per week
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

# Download newly available updates in background
defaults write com.apple.SoftwareUpdate AutomaticDownload -int 1

# Install System data files & security updates
defaults write com.apple.SoftwareUpdate CriticalUpdateInstall -int 1

# Automatically download apps purchased on other Macs
defaults write com.apple.SoftwareUpdate ConfigDataInstall -int 1

# Turn on app auto-update
defaults write com.apple.commerce AutoUpdate -bool true

# Allow the App Store to reboot machine on macOS updates
defaults write com.apple.commerce AutoUpdateRestartRequired -bool true

###############################################################################
# Photos                                                                      #
###############################################################################

# Prevent Photos from opening automatically when devices are plugged in
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

###############################################################################
# Messages                                                                    #
###############################################################################

# Disable automatic emoji substitution (i.e. use plain text smileys)
defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "automaticEmojiSubstitutionEnablediMessage" -bool false

# Disable smart quotes as it’s annoying for messages that contain code
defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "automaticQuoteSubstitutionEnabled" -bool false

# Disable continuous spell checking
defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "continuousSpellCheckingEnabled" -bool false

###############################################################################
# Google Chrome & Google Chrome Canary                                        #
###############################################################################

# Allow installing user scripts via GitHub Gist or Userscripts.org
defaults write com.google.Chrome ExtensionInstallSources -array "https://gist.githubusercontent.com/" "http://userscripts.org/*"
defaults write com.google.Chrome.canary ExtensionInstallSources -array "https://gist.githubusercontent.com/" "http://userscripts.org/*"

# Disable the all too sensitive backswipe on trackpads
defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool false
defaults write com.google.Chrome.canary AppleEnableSwipeNavigateWithScrolls -bool false

# Disable the all too sensitive backswipe on Magic Mouse
defaults write com.google.Chrome AppleEnableMouseSwipeNavigateWithScrolls -bool false
defaults write com.google.Chrome.canary AppleEnableMouseSwipeNavigateWithScrolls -bool false

# Use the system-native print preview dialog
defaults write com.google.Chrome DisablePrintPreview -bool true
defaults write com.google.Chrome.canary DisablePrintPreview -bool true

# Expand the print dialog by default
defaults write com.google.Chrome PMPrintingExpandedStateForPrint2 -bool true
defaults write com.google.Chrome.canary PMPrintingExpandedStateForPrint2 -bool true

###############################################################################
# Sublime Text                                                                #
###############################################################################

# Install Sublime Text settings
cp -r init/Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text*/Packages/User/Preferences.sublime-settings 2> /dev/null

###############################################################################
# Transmission.app                                                            #
###############################################################################

# Use `~/Documents/Torrents` to store incomplete downloads
defaults write org.m0k.transmission UseIncompleteDownloadFolder -bool true
defaults write org.m0k.transmission IncompleteDownloadFolder -string "${HOME}/Documents/Torrents"

# Don’t prompt for confirmation before downloading
defaults write org.m0k.transmission DownloadAsk -bool false
defaults write org.m0k.transmission MagnetOpenAsk -bool false

# Trash original torrent files
defaults write org.m0k.transmission DeleteOriginalTorrent -bool true

# Hide the donate message
defaults write org.m0k.transmission WarningDonate -bool false
# Hide the legal disclaimer
defaults write org.m0k.transmission WarningLegal -bool false

# IP block list.
# Source: https://giuliomac.wordpress.com/2014/02/19/best-blocklist-for-transmission/
defaults write org.m0k.transmission BlocklistURL -string "http://john.bitsurge.net/public/biglist.p2p.gz"
defaults write org.m0k.transmission BlocklistAutoUpdate -bool true

###############################################################################
# Kill affected applications                                                  #
###############################################################################

for app in "Activity Monitor" "Address Book" "Calendar" "Contacts" "cfprefsd" \
	"Dock" "Finder" "Google Chrome" "Google Chrome Canary" "Mail" "Messages" \
	"Opera" "Photos" "Safari" "SizeUp" "Spectacle" "SystemUIServer" "Terminal" \
	"Transmission" "Tweetbot" "Twitter" "iCal"; do
	killall "${app}" &> /dev/null
done
echo "Done. Note that some of these changes require a logout/restart to take effect."