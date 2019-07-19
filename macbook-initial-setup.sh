#!/bin/bash

# install homebrew apps repositories manager
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# add repo with drivers to cask (needed for Steelseries Engine)
brew tap homebrew/cask-drivers

# add repo with different versions to cask (needed for java8)
brew tap homebrew/cask-versions

# list of non-AppStore apps
nonAppStoreApps=(
    transmission # Torrents client
    skype # Communicator
    keka # Rar extractor
    google-chrome # Browser
    iina # Video watching app
    scroll-reverser # Reverse scrolling setting separate for touchpad and mouse
    vlc # Video watching app
    xquartz # X11 windows server needed for wine
    wine-stable # App to open Windows .exe files
    libreoffice # Documents/spreadsheets/presentations editor
    steelseries-engine # Steelseries mouse drivers
    bbedit # Text editor
    sourcetree # GUI for git and gitflow
    iterm2 # Alternative terminal
    macdown # Markdown editor
    sketch # UI/UX design tool
    zeplin # UI/UX designs viewer
    bettertouchtool # Custom gestures for touchpad and touchbar
    AmorphousDiskMark # HDD benchmark
    charles # Web debugging proxy
    kode54-cog # Music and audio player
    cyberduck # FTP client
    drivedx # SMART status and HDD health tool
    firefox # Browser
    calibre # Mobi/epub e-book converter
    gimp # Image editor
    java # OPEN JDK for apps that needs java
    java8 # ORACLE java8
    jubler # Subtitles editor
    opera # Browser
    postman # HTTP requests tool
    spotify # Music streaming service
    tableplus # SQL client
    tor-browser # Browser preconfigured with TOR network
    unetbootin # Live USB systems maker
    virtualbox # Virtual Machine
    virtualbox-extension-pack # Extensions for virtualbox such as display resolution and USB
    xld # Audio converter
    sdformatter # SD card formatter recommanded by SD Association
    musicbrainz-picard # Audio tags editor
    flixtools # Subtitles downloader
    protonmail-bridge # Encryption bridge for Proton Mail
    anki # App for learning with flashcards
    visual-studio-code # Electron based modern code editor
    dotnet-sdk # Dotnet language support
    sherlock # App to edit iOS Views on the fly
    steam # Gaming platform
    gog-galaxy # Gaming platform
    battle-net # Gaming platform
    origin # Gaming platform
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

# Install Battle.net
open /usr/local/Caskroom/battle-net/latest/Battle.net-Setup.app

# list of AppStore apps
appStoreApps=(
    929507092 # PhotoScape X (Photo Editor)
    593341977 # PDF Attributes (PDF metadata editor)
    497799835 # Xcode (Apple IDE)
    1333542190 # 1Password 7 (Password Manager)
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
    1453837387 # Rubicon (Xcode extension for Stub, Spy and Dummy)
    1330801220 # quicktype (JSON to Code generator)
    430798174 # HazeOver (App that dims unfocused windows.)
)

# Install AppStore apps
mas install ${appStoreApps[@]}

# Install terminal colors for Bash (choose between light and dark theme)
echo -e "export CLICOLOR=1\n#light theme\nexport LSCOLORS=ExFxBxDxCxegedabagacad\n#dark theme\n#export LSCOLORS=GxFxCxDxBxegedabagaced" >> ~/.bash_profile

# Change login shell to zsh. This is default shell for MacOS Catalina and above, this is only for legacy systems
chsh -s /bin/zsh

#Install Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install terminal colors for zsh (light theme)
echo -e 'export LSCOLORS="ExFxBxDxCxegedabagacad"' >> ~/.zshrc
echo -e 'export LS_COLORS="di=1;34:ln=1;35:so=1;31:pi=1;33:ex=1;32:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"' >> ~/.zshrc
echo -e "zstyle ':completion:*:default' list-colors \${(s.:.)LS_COLORS}" >> ~/.zshrc

# Replaces default theme with jreese theme (works with light theme)
sed -i -e 's/ZSH_THEME="robbyrussell"/ZSH_THEME="jreese"/g' ~/.zshrc

# Uncomment en_US.UTF-8 locale for console, making them undependable from macOS locale settings
sed -i -e 's/#export LANG=en_US.UTF-8/export LANG=en_US.UTF-8/g' ~/.zshrc

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

echo "Setting up dock size…"
defaults write com.apple.dock tilesize -int 40

echo "Restarting dock…"
killall Dock

# List of brew packages
brewPackages=(
    swiftlint # Linter for swift language
    carthage # Dependency manager for iOS apps
    python # Python version 3.7, preinstalled is 2.7
    gnupg # OpenPGP for signing and encrypting
    pinentry-mac # App to use keychain for PGP passwords
    wget # Terminal network downloader
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

# Add Xcode style to Prism inside MacDown
cp ./other/prism-xcode.css /Applications/MacDown.app/Contents/Resources/Prism/themes/prism-xcode.css

# Make SourceTree see our GPG binary file (it searches for gpg2)
ln -s /usr/local/bin/gpg /usr/local/bin/gpg2

# Set your PGP key for git. WARNING: You need to replace the <KeyIdVALUE> with the actual GPG key id.
git config --global user.signingkey <KeyIdVALUE>

# Add your GPG key to bash
echo 'export GPG_TTY=$(tty)' >> ~/.bash_profile

# Add your GPG key to zsh
echo 'export GPG_TTY=$(tty)' >> ~/.zshrc

# Make all commits signed by default
git config --global commit.gpgsign true

# Make pinentry-mac your default pientry choice
echo "pinentry-program /usr/local/bin/pinentry-mac" >> ~/.gnupg/gpg-agent.conf

# Download PushNotifications zip - Notification Sender for Apple Push Notification Service
wget https://github.com/onmyway133/PushNotifications/releases/download/1.4.0/PushNotifications-1.4.0-mac.zip -P ~/Downloads/

# Unzip PushNotifications straight to Applications
unzip ~/Downloads/PushNotifications-1.4.0-mac.zip -d /Applications/

# Delete PushNotifications zip
rm -rf ~/Downloads/PushNotifications-1.4.0-mac.zip 

# Download SwiftInitGenerator zip - Xcode extension for generating inits code
wget https://github.com/Atimca/SwiftInitGenerator/releases/download/0.0.1/SwiftInitGenerator.zip -P ~/Downloads/

# Unzip SwiftInitGenerator straight to Applications
unzip ~/Downloads/SwiftInitGenerator.zip -d /Applications/

# Delete SwiftInitGenerator zip
rm -rf ~/Downloads/SwiftInitGenerator.zip
