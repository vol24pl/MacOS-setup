#!/bin/bash

# Change login shell to zsh. This is default shell for MacOS Catalina and above, this is only for legacy systems
# chsh -s /bin/zsh

# install homebrew apps repositories manager
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# add repo with drivers to cask (needed for Steelseries Engine and Logitech Camera Settings)
brew tap homebrew/cask-drivers

# List of non-AppStore apps
nonAppStoreApps=(
#Browsers
    opera # One of the top browsers with build in VPN
    firefox # Most popular open source browser
    google-chrome # Most popular browser
    tor-browser # Browser preconfigured with TOR network
#Developer
    postman # Most popular HTTP requests tool
    visual-studio-code # Modern code editor with community-driven plugins
    tableplus # Modern SQL client
    bbedit # Most stable macOS text editor that can handle huge files
    charles # Web debugging proxy
    mactex # Full LateX installation with supporting apps, about 4GB!
    iterm2 # Alternative terminal
    sketch # UI/UX design tool
    zeplin # UI/UX design viewer
    typora # Markdown single pane editor
    sourcetree # GUI for git and gitflow
    sherlock # App to edit iOS Views on the fly
    isimulator # App to manage iOS Simulators
    cyberduck # FTP client
#SECURITY
    protonvpn # VPN from ProtonMail
    protonmail-bridge # Bridge for email clients to work with ProtonMail
    authy # 2-factor authenticator
#HDD
    drivedx # SMART status and HDD health tool
    AmorphousDiskMark # HDD benchmarking tool
    balenaetcher # creating USB drives
    sdformatter # SD card formatter recommended by SD Association
    ApplePi-Baker # App for making the binary image copies of the whole drives
#Video
    iina # Best looking macOS video watching app
    vlc # Most popular cross-platform video watching app
    handbrake # Video Transcoder
#Graphics
    gimp # Graphics editor
    paintbrush # Simple Microsoft Paint-like drawing tool #WARNING: It changes images DPI!
#Subtitles
    aegisub # Subtitles editor
    flixtools # Subtitles downloader
#OTHER
    transmission # Torrents client
    skype # Communicator
    keka # Rar extractor
    libreoffice # Documents/spreadsheets/presentations editor
    steelseries-engine # Steelseries mouse drivers
    bettertouchtool # Custom gestures for touchpad and touchbar, and reverse scrolling setting separate for touchpad and mouse.
    calibre # Mobi/epub e-book converter
    virtualbox # Virtual Machine
    virtualbox-extension-pack # Extensions for virtualbox such as display resolution and USB
    logitech-camera-settings  #drivers for the webcamera
    signal # End-to-end encrypted messenger
#Audio 
    kode54-cog # Music and audio player    
    xld # Audio converter
    musicbrainz-picard # Audio tags editor
#Unused
#Games: WARNING Most games are 32-bit and won't work on Catalina
    # steam # Biggest gaming platform from Valve
    # gog-galaxy # Gaming platform with huge retro library from CD-Projekt
    # battle-net # Blizzard's gaming platform
    # origin # EA's gaming platform
    # epic-games # Epic's gaming platform
#Developer
    # pycharm-ce # Python IDE from JetBrains
    # webstorm # JavaScript IDE from JetBrains
    # intellij-idea-ce # Java IDE from JetBrains
    # sublime-text # Cross-platform code editor with it's own high performance rendering engine
    # macdown # Markdown 2 panes editor
    # dotnet-sdk # Dotnet language support
    # docker # App to make containers for environments 
    # insomnia # Open source HTTP requests tool
    # paw # MacOS native HTTP requests tool
	# reveal # App to edit iOS Views on the fly
#Other
    # linein # App for redirecting macOS audio between sources
    # spotify # Most popular music streaming service
    # soundflower # App giving additional audio sources for audio manipulation
    # anki # App for learning with flashcards
    # zoomus # Video conference App
    # xquartz # X11 windows server needed for wine
    # wine-stable # App to open Windows .exe files
   	# scroll-reverser # Reverse scrolling setting separate for touchpad and mouse. Use instead of bettertouchtool
    # spotify # Music streaming service
    # paragon-ntfs # Support for NTFS file system
    # thunderbird # Open Source Email client
)

# install non-AppStore apps
brew cask install ${nonAppStoreApps[@]}

# Install Battle.net (additional step for battle-net cask)
# open /usr/local/Caskroom/battle-net/latest/Battle.net-Setup.app

# Install AppStore CLI installer
brew install mas

# list of AppStore apps
appStoreApps=(
    929507092 # PhotoScape X (Photo Editor)
    593341977 # PDF Attributes (PDF metadata editor)
    497799835 # Xcode (Apple IDE)
    1333542190 # 1Password 7 (Password Manager)
    1091189122 # Bear (Notes with markdown support)
    904280696 # Things 3 (TODO app)
    975937182 # Fantastical 3 (Calendar app)
    1335413823 # Ka-Block! (Ads blocking Safari extension)
    768053424 # Gapplin (Vector images viewer/converter)
    803453959 # Slack (Communicator)
    462054704 # Microsoft Word (Documents editor)
    462058435 # Microsoft Excel (Spreadsheets editor)
    462062816 # Microsoft PowerPoint (Presentations editor)
    409201541 # Pages (Apple's documents editor)
    409203825 # Numbers (Apple's spreadsheets editor)
    409183694 # Keynote (Apple's presentations editor)
    1120214373 # Battery Health 2 (Battery stats and health)
    425424353 # The Unarchiver (Archives extractor)
    1007457278 # Realm Browser (Realm databases browser)
    1278508951 # Trello (Project management tool)
    688211836 # EasyRes (resolution changer for retina)
    1330801220 # quicktype (JSON to Code generator)
    430798174 # HazeOver (App that dims unfocused windows)
    425955336 # Skitch (App for marking pictures)
    1081413713 # GIF Brewery 3 (Recording screen or camera stream as a GIF)
    957734279 # Toggl (Time tracking app)
    411643860 # Daisy Disk (App for recovering disk space)
    1388020431 # DevCleaner for Xcode (App for deleting old Xcode files in ~/Library/Developer folder)
#Unused
    # 682658836 # Garage Band (App for creating and learning music)
    # 405399194 # Kindle (Mobi file format reader)
    # 985367838 # Microsoft Outlook (Email client)
    # 673660806 # Controllers Lite (Gamepads diagnostics app)
)

# Install AppStore apps
mas install ${appStoreApps[@]}

# Install terminal colors for Bash (choose between light and dark theme)
echo -e "export CLICOLOR=1\n#light theme\nexport LSCOLORS=ExFxBxDxCxegedabagacad\n#dark theme\n#export LSCOLORS=GxFxCxDxBxegedabagaced" >> ~/.bash_profile

#Install Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

#Fix Catalina bug with "Insecure completion-dependent directories detected"
compaudit | xargs chmod g-w,o-w

# Install terminal colors for zsh (light theme)
# Use this generator to translate BSD colors and Linux colors: https://geoff.greer.fm/lscolors/
echo -e 'export LSCOLORS="ExFxBxDxCxegedabagacad"' >> ~/.zshrc
echo -e 'export LS_COLORS="di=1;34:ln=1;35:so=1;31:pi=1;33:ex=1;32:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"' >> ~/.zshrc
echo -e "zstyle ':completion:*:default' list-colors \${(s.:.)LS_COLORS}" >> ~/.zshrc

# Replaces default theme with jreese theme (works great with light theme)
sed -i -e 's/ZSH_THEME="robbyrussell"/ZSH_THEME="jreese"/g' ~/.zshrc

# Uncomment en_US.UTF-8 locale for console, making them undependable from macOS locale settings
sed -i -e 's/# export LANG=en_US.UTF-8/export LANG=en_US.UTF-8/g' ~/.zshrc

# Disable mouse acceleration with defaults. Crucial for gaming
defaults write .GlobalPreferences com.apple.mouse.scaling -1

# Copy SF Mono font (available only in Xcode and Terminal.app) to the system
cp -R /System/Applications/Utilities/Terminal.app/Contents/Resources/Fonts/. /Library/Fonts/

# Use bbedit as a git editor
git config --global core.editor "bbedit -w"

# Remove ALL icons (except Finder) from dock
echo "Removing all icons (except Finder) from the dock…"
defaults write com.apple.dock persistent-apps -array

# List of dock icons
dockIcons=(
    /System/Applications/Utilities/Terminal.app
    /System/Applications/Mail.app
    /System/Applications/Messages.app
    /Applications/Slack.app
    /Applications/Safari.app
    /System/Applications/Music.app
    /Applications/Bear.app
    /Applications/Things3.app
    /Applications/Fantastical.app
    /Applications/Sourcetree.app
    /Applications/BBEdit.app
    "/Applications/Visual Studio Code.app"
    /Applications/Xcode.app
)

# Adding icons
for icon in "${dockIcons[@]}"
do
    echo "Adding $icon to the dock…"
    defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>$icon</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"
done

echo "Setting up dock size…"
defaults write com.apple.dock tilesize -int 40

echo "Restarting dock…"
killall Dock

# List of brew packages
brewPackages=(
    swiftlint # Linter for swift language
    carthage # Dependency manager for iOS apps
    gnupg # OpenPGP for signing and encrypting
    pinentry-mac # App to use macOS native keychain for PGP passwords
    pandoc # Markup to Word/Open office converter needed by Typora
    pandoc-citeproc # Pandoc's citation parser
    bash # newest bash version. System's default is 3
    coreutils # GNU File, Shell, and Text utilities
    dmg2img # Utilities for converting macOS DMG images
    gzip  # Popular GNU data compression program
    unzip # Extraction utility for .zip compressed archives
    wget # Internet file retriever
    mint # Dependency manager that installs and runs Swift command-line tool packages
#Unused
    # vapor/tap/vapor # backend framework
    # python # Python version 3.7, preinstalled is 2.7
)

# install brew packages
brew install ${brewPackages[@]}

# As we installed homebrew before xcode, we need to switch to Xcode Command Line Tools
sudo xcode-select -s /Applications/Xcode.app/Contents/Developer

# List of mint packages
mintPackages=(
    MakeAWishFoundation/SwiftyMocky # Library to autogenerate mocks
)

mint install ${mintPackages[@]}

# install CocoaPods dependency manager for iOS apps
sudo gem install cocoapods

# install CocoaPods Keys plugin
sudo gem install cocoapods-keys

# Xcode won't ask for password with every build
DevToolsSecurity -enable

# Create symlinks between home folder and iCloud folders
# Without this navigating in Finder between iCloud folders (like Desktop) 
# and Home Folders (like Downloads) only with keyboard is nearly impossible

#WARNING This command uses "~" sign, so don't just copy paste it using ZSH. Use bash for this one!
ln -s ~/ ~/Library/Mobile\ Documents/com~apple~CloudDocs/$(whoami)\ home\ symlink
ln -s ~/Library/Mobile\ Documents/com~apple~CloudDocs/Documents ~/Documents\ symlink
ln -s ~/Desktop ~/Desktop\ symlink

# If you want to make a Developer folder synchronise. 
# So far only compiling LateX doesn't work in this folder because of "~" sign in the path.

# mkdir ~/Library/Mobile\ Documents/com~apple~CloudDocs/Developer #if not there yet
ln -s ~/Library/Mobile\ Documents/com~apple~CloudDocs/Developer ~/Developer\ symlink

#Export GPG keys (from the other mac!)
#Get the keys IDs
gpg --list-keys
gpg --list-secret-keys
#Export keys
gpg --export-secret-keys --armor <key> > ./file-sec.gpg
gpg --export --armor <key> > ./file.gpg

# Import GPG keys. 
# WARNING: You need to replace the <Path to pub key> and <Path to prv key> with the actual paths.
gpg --import <Path to pub key>
gpg --allow-secret-key-import --import <Path to prv key>

# Make pinentry-mac your default pientry choice
echo "pinentry-program /usr/local/bin/pinentry-mac" >> ~/.gnupg/gpg-agent.conf

# Make SourceTree see our GPG binary file (it searches for gpg2). This should automatically choose the current version
ln -s /usr/local/Cellar/gnupg/`ls /usr/local/Cellar/gnupg/`/bin/gpg /usr/local/Cellar/gnupg/`ls /usr/local/Cellar/gnupg/`/bin/gpg2

# Configure git

# On a specific repository...
git config user.email "myname@domain.com"
git config user.name "My Name"
git config user.signingkey <KeyIdVALUE>
git config commit.gpgsign true

# … or globally
git config --global commit.gpgsign true
git config --global user.signingkey <KeyIdVALUE>

## CRUCIAL TO CHECK IF YOUR MAC HAD PREVIOUS OWNERS (OR IS NOT YOURS)
# To check if your Mac is enrolled to Mobile Device Management try renewing it
sudo profiles renew -type enrollment
# And then validate
sudo profiles validate -type enrollment
# By default you should not be enrolled. If you are, external organisation can manage your macOS!

# Update installed apps and clear caches
brew update
brew upgrade
brew cask upgrade
brew cleanup
rm -rf ~/Library/Caches/Homebrew
