#!/bin/bash

# install homebrew apps repositories manager
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# add repo with drivers to cask (needed for Steelseries Engine)
brew tap homebrew/cask-drivers

# add repo with different versions to cask (needed for java8)
brew tap homebrew/cask-versions

# list of non-AppStore apps
nonAppStoreApps=(
    transmission # torrents client
    skype # communicator
    keka # rar extractor
    google-chrome # browser
    iina # video watching app
    scroll-reverser # reverse scrolling setting separate for touchpad and mouse
    vlc # video watching app
    xquartz # X11 windows server needed for wine
    wine-stable # app to open Windows .exe files
    libreoffice # documents/spreadsheets/presentations editor
    steelseries-engine # steelseries mouse drivers
    bbedit # text editor
    sourcetree # GUI for git and gitflow
    iterm2 # alternative terminal
    macdown # markdown editor
    sketch # UI/UX design tool
    zeplin # UI/UX designs viewer
    bettertouchtool # custom gestures for touchpad and touchbar
    AmorphousDiskMark # HDD benchmark
    charles # web debugging proxy
    kode54-cog # music and audio player
    cyberduck # FTP client
    drivedx # SMART status and HDD health tool
    firefox # browser
    calibre # mobi/epub e-book converter
    gimp # image editor
    java # OPEN JDK for apps that needs java
    java8 # ORACLE java8
    jubler # subtitles editor
    opera # browser
    postman # HTTP requests tool
    spotify # music streaming service
    tableplus # SQL client
    tor-browser # browser preconfigured with TOR network
    unetbootin # live USB systems maker
    virtualbox # Virtual Machine
    virtualbox-extension-pack # extensions for virtualbox such as display resolution and USB
    xld # audio converter
    sdformatter # SD card formatter recommanded by SD Association
    musicbrainz-picard # audio tags editor
    flixtools # subtitles downloader
    protonmail-bridge # Encryption bridge for Proton Mail
    anki # app for learning with flashcards
    visual-studio-code # electron based modern code editor
    dotnet-sdk # dotnet language support
    sherlock # App to edit iOS Views on the fly
    steam # Gaming platform
    isimulator # App to manage iOS Simulators
    linein # App for redirecting audio
    soundflower # App giving additional audio sources
    pycharm-ce # Python IDE
    intellij-idea-ce # Java IDE
)

# install non-AppStore apps
brew cask install ${nonAppStoreApps[@]}

# Install AppStore CLI installer
brew install mas

# list of AppStore apps
appStoreApps=(
    929507092 # PhotoScape X - Photo Editor
    593341977 # PDF Attributes (PDF metadata editor)
    497799835 # Xcode (Apple IDE)
    1333542190 # 1Password 7 - Password Manager
    1091189122 # Bear (Notes with markdown support)
    904280696 # Things 3 (TODO app)
    975937182 # Fantastical 2 (Calendar app)                                 
    1335413823 # Ka-Block! (Ads blocking Safari extension)
    768053424 # Gapplin (vector images viewer/converter)
    803453959 # Slack (communicator)
    405399194 # Kindle (mobi reader)
    462054704 # Microsoft Word (Documents editor)
    462058435 # Microsoft Excel (Spreadsheets editor)
    462062816 # Microsoft PowerPoint (Presentations editor)
    409201541 # Pages (Documents editor)
    409203825 # Numbers (Spreadsheets editor)
    409183694 # Keynote (Presentations editor)
    1120214373 # Battery Health 2 (Battery stats and health)
    425424353 # The Unarchiver (Archives extractor)
    1007457278 # Realm Browser (Realm databases browser)
    673660806 # Controllers Lite (Gamepads diagnostics app)
    1278508951 # Trello (Project management tool)
    688211836 # EasyRes (resolution changer for retina)
    1453837387 # Rubicon. Xcode extension for Stub, Spy and Dummy
	1330801220 # quicktype. JSON to Code generator
	430798174 # HazeOver. App that dims unfocused windows.
)

# Install AppStore apps
mas install ${appStoreApps[@]}

# Install terminal colors (choose between light and dark theme)
echo -e "export CLICOLOR=1\n#light theme\nexport LSCOLORS=ExFxBxDxCxegedabagacad\n#dark theme\n#export LSCOLORS=GxFxCxDxBxegedabagaced" > ~/.bash_profile

# Disable mouse acceleration with defaults
defaults write .GlobalPreferences com.apple.mouse.scaling -1

# Copy SF Mono font (available only in Xcode and Terminal.app) to system
cp -R /Applications/Utilities/Terminal.app/Contents/Resources/Fonts/. /Library/Fonts/

# Use bbedit as git editor
git config --global core.editor "bbedit -w"

# Remove ALL icons (except Finder) from dock
echo "Removing all icons (except Finder) from the dock…"
defaults write com.apple.dock persistent-apps -array

# List of dock icons
dockIcons=(
	Utilities/Terminal.app
	Mail.app
	Messages.app
	Slack.app
	Safari.app
	iTunes.app
	Bear.app
	Things3.app
	Fantastical 2.app
	BBEdit.app
	Sourcetree.app
	Xcode.app
)

# Adding icons
for icon in "${dockIcons[@]}"
do
    echo "Adding $icon to the dock…"
    defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/$icon</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"
done

echo "Restarting dock…"
killall Dock

# List of brew packages
brewPackages=(
    swiftlint # linter for swift language
    carthage # dependency manager for iOS apps
    python # Python version 3.7, preinstalled is 2.7
)

# install brew packages
brew install ${brewPackages[@]}

# install CocoaPods dependency manager for iOS apps
sudo gem install cocoapods

# install CocoaPods Keys plugin
sudo gem install cocoapods-keys

# Xcode won't ask for password with every build
DevToolsSecurity -enable

# Create symlinks between home folder and iCloud folders
myUsername=$(whoami)
ln -s ~/ ~/Library/Mobile\ Documents/com~apple~CloudDocs/$myUsername\ home\ symlink
ln -s ~/Library/Mobile\ Documents/com~apple~CloudDocs/Documents ~/Documents\ symlink
ln -s ~/Desktop ~/Desktop\ symlink
mkdir ~/Library/Mobile\ Documents/com~apple~CloudDocs/Developer
ln -s ~/Library/Mobile\ Documents/com~apple~CloudDocs/Developer ~/Developer\ symlink

# add Xcode style to Prism inside MacDown
cp ./other/prism-xcode.css /Applications/MacDown.app/Contents/Resources/Prism/themes/prism-xcode.css
