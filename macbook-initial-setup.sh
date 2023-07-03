#!/bin/bash

# install homebrew apps repositories manager
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Run these two commands in your terminal to add Homebrew to your PATH:
# Add on each boot
(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/$USER/.zprofile
# Add now
eval "$(/opt/homebrew/bin/brew shellenv)"

# add repo with drivers to cask (needed for Steelseries Engine, Logitech Camera Settings, Logitech G-Hub)
brew tap homebrew/cask-drivers

# List of Apps that have to be downloaded by hand ⚠️ This script only prints them!
appsToDownloadList=(
    DaVinci-Resolve # The best free video editor
)
echo "⚠️ Please download this apps by hand: ${appsToDownloadList[@]}"

# List of non-AppStore apps
nonAppStoreApps=(
#Browsers
    firefox # Most popular open source browser
    brave-browser # Open Source replacement for the Google Chrome with built in adblockers
#Developer
    rapidapi # MacOS native HTTP requests tool (Paw is an old name for the same App).
    visual-studio-code # Electron-based code editor with community-driven plugins developed by Microsoft
    tableplus # Modern SQL client
    bbedit # Most stable macOS text editor that can handle huge files
    proxyman # Web debugging proxy
    mactex # Full LateX installation with supporting apps, about 4GB!
    sketch # UI/UX design tool
    zeplin # UI/UX design viewer
    typora # Markdown single pane editor
    fork # Modern GUI for git and gitflow
    cyberduck # FTP client
#SECURITY
    protonvpn # VPN from ProtonMail
    1password # Password Manager. Use this instead of the deprecated one on the App Store.
#HDD
    daisydisk # Daisy Disk (App for recovering disk space)
    mounty # NTFS file system write without hassle. No drivers, no kext.
    drivedx # SMART status and HDD health tool
#Video
    iina # Best looking macOS video watching app
    vlc # Most popular cross-platform video watching app
    handbrake # Video Transcoder
#Graphics
    paintbrush # Simple Microsoft Paint-like drawing tool #WARNING: It changes images DPI!
    gimp # Graphics editor
#Subtitles
    flixtools # Subtitles downloader
#OTHER
    signal # End-to-end encrypted messenger
    skype # Communicator
    monitorcontrol # Monitor control works with media keys to set brightness of the display and HDMI output sounds volume
    keka # Rar extractor
    libreoffice # Documents/spreadsheets/presentations editor
    utm # Virtual Machine frontend working with ARM M1 cpu. QEMU under the hood.
    scroll-reverser # Reverse scrolling setting separate for touchpad and mouse. Use instead of bettertouchtool
    discord # Text and audio chat
    calibre # Mobi/epub e-book converter
    logitech-g-hub # Mouse/Keyobard/Camera drivers for Logitech devices
    protonmail-bridge # Bridge for email clients to work with ProtonMail
    transmission # Torrents client
#Audio 
    cog # Music and audio player    
    spotify # Most popular music streaming service
#Unused by me, but worth considering
# Apps that makes sens only for x86
    # virtualbox # Virtual Machine that can virtualize if you have x86 CPU
    # virtualbox-extension-pack # Extensions for virtualbox such as display resolution and USB
# Requires Rosetta 2, not for M1 purist :)
# For details look at https://doesitarm.com
    # sdformatter # SD card formatter recommended by SD Association
    # logitech-camera-settings # Drivers for the webcamera. Included in logitech-g-hub
    # authy # 2-factor authenticator # Not ARM ready. For M1 Use this instead https://apps.apple.com/pl/app/twilio-authy/id494168017
    # aegisub # Subtitles editor
    # musicbrainz-picard # Audio tags editor
    # ApplePi-Baker # App for making the binary image copies of the whole drives
    # balenaetcher # creating USB drives
    # raspberry-pi-imager # creating images for Raspberry Pi
    # AmorphousDiskMark # HDD benchmarking tool
    # tor-browser # Browser preconfigured with TOR network
# Not signed
    # xld # Audio converter
    # isimulator # App to manage iOS Simulators
# Requires KEXT:
    # paragon-ntfs # NTFS file system support
#Games: WARNING Most games are 32-bit and won't work on Catalina or above
    # steam # Biggest gaming platform from Valve
    # gog-galaxy # Gaming platform with huge retro library from CD-Projekt
    # battle-net # Blizzard's gaming platform
    # origin # EA's gaming platform
    # epic-games # Epic's gaming platform
#Developer
    # pycharm-ce # Python IDE from JetBrains (community edition)
    # webstorm # JavaScript IDE from JetBrains
    # intellij-idea-ce # Java IDE from JetBrains (community edition)
    # sublime-text # Cross-platform code editor with it's own high performance rendering engine
    # atom # Electron-based code editor with community-driven plugins developed by Github
    # macdown # Markdown 2 panes editor
    # dotnet-sdk # Dotnet language support
    # docker # App to make containers for environments 
    # postman # Most popular HTTP requests tool
    # charles # Web debugging proxy
    # insomnia # Electron-based open source HTTP requests tool
	# reveal # App to edit iOS Views on the fly
    # iterm2 # Alternative terminal
    # sourcetree # GUI for git and gitflow. Use Fork instead as Fork does not have problems with GPG keys ;)
    # avocode # UI/UX design tool
#Other
    # steelseries-gg # Steelseries mouse drivers + bloatware. I'm done with Steelseries^^ 
    # bettertouchtool # Custom gestures for touchpad and touchbar, and reverse scrolling setting separate for touchpad and mouse.
    # linein # App for redirecting macOS audio between sources (Audio  Play-Thru). This may not work with Big Sur. Look at https://www.rogueamoeba.com for alternatives.
    # blackhole-2ch # App giving additional audio sources for audio manipulation (2 channels) / Alternative to Soundflower for ARM Macs
    # blackhole-16ch # App giving additional audio sources for audio manipulation (16 channels) / Alternative to Soundflower for ARM Macs
    # anki # App for learning with flashcards
    # zoom # Video conference App
    # xquartz # X11 windows server needed for wine
    # wine-stable # App to open Windows .exe files
    # spotify # Music streaming service
    # thunderbird # Open Source Email client
    # heaven # Popular GPU Benchmark
    # little-snitch # Blocker for app's unwanted Internet traffic
)

# To get Discord for M1 before it's supported in the main version
brew tap homebrew/cask-versions                    
brew install --cask discord-canary

# install non-AppStore apps
brew install --cask ${nonAppStoreApps[@]}

# Install Battle.net (additional step for battle-net cask)
# open /usr/local/Caskroom/battle-net/latest/Battle.net-Setup.app

# Install AppStore CLI installer
brew install mas

# list of AppStore apps
appStoreApps=(
    593341977 # PDF Attributes (PDF metadata editor)
    497799835 # Xcode (Apple IDE)
    1569813296 # 1Password for Safari (Extension for Safari, as the built-in one was deprecated)
    1091189122 # Bear (Notes with markdown support)
    904280696 # Things 3 (TODO app)
    1335413823 # Ka-Block! (Ads blocking Safari extension)
    1544743900 # Hush (Safari extension that hides cookies consent popups)
    803453959 # Slack (Communicator)
    462054704 # Microsoft Word (Documents editor)
    462058435 # Microsoft Excel (Spreadsheets editor)
    462062816 # Microsoft PowerPoint (Presentations editor)
    409201541 # Pages (Apple's documents editor)
    409203825 # Numbers (Apple's spreadsheets editor)
    409183694 # Keynote (Apple's presentations editor)
    425424353 # The Unarchiver (Archives extractor)
    430798174 # HazeOver (App that dims unfocused windows)
    1388020431 # DevCleaner for Xcode (App for deleting old Xcode files in ~/Library/Developer folder)
    425264550 # Blackmagic HDD Speed test benchmark
    1352778147 # Bitwarden
    1484801884 # Pomodoro timer
    441258766 # Magnet. Tool to have a Windows7-like window management by dragging windows. Use instead of bettertouchtool
    972028355 # Micro Snitch. App to monitor the activity of camera and microphone
    688211836 # EasyRes (resolution changer for retina) 
    1295203466 # Microsoft Remote Desktop. Best remote desktop for controlling Windows PC
#Unused
    # 417375580 # Better Snap Tool. Use instead of Magnet if the latter is too expensive.
    # 682658836 # Garage Band (App for creating and learning music)
    # 408981434 # iMovie (App for filmmaking)
    # 405399194 # Kindle (Mobi file format reader)
    # 985367838 # Microsoft Outlook (Email client)
    # 673660806 # Controllers Lite (Gamepads diagnostics app)
    # 1466185689 # Blackmagic CPU/GPU speed benchmark
    # 975937182 # Fantastical (Calendar app)
    # 1438310985 # SimplePing - too see if you have a connection on Status menus. Paid but M1 compatible!
# Requires Rosetta 2, not for M1 purist :)
    # 1158928913 # PingStatus - too see if you have a connection on Status menus
    # 1081413713 # GIF Brewery 3 (Recording screen or camera stream as a GIF)
    # 768053424 # Gapplin (Vector images viewer/converter)
    # 425955336 # Skitch (App for marking pictures)
    # 929507092 # PhotoScape X (Photo Editor)
    # 1480068668 # Facebook Messenger
    # 1278508951 # Trello (Project management tool)
    # 957734279 # Toggl (Time tracking app)
    # 1007457278 # Realm Browser (Realm databases browser)
    # 1246969117 # Steam Link (Playing Steam games from remote PC on this macOS)
)

# Install AppStore apps
# WARNING: This tool can only reinstall apps that are already tied to you account. If you're downloading something for the first time do it through AppStore
mas install ${appStoreApps[@]}

# Install terminal colors for Bash (choose between light and dark theme)
echo -e "export CLICOLOR=1\n#light theme\nexport LSCOLORS=ExFxBxDxCxegedabagacad\n#dark theme\n#export LSCOLORS=GxFxCxDxBxegedabagaced" >> ~/.bash_profile

#Install Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

#Fix Catalina bug with "Insecure completion-dependent directories detected". Uncomment only when needed
#compaudit | xargs chmod g-w,o-w

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
# from macOS 14 Sonoma, there's a separate control to set mouse acceleration and speed! 🎉🎉🎉 It took only 40 years 🙃
# I'm commenting out this command as a form of deprecation. I'll remove this command in the near future.
# defaults write .GlobalPreferences com.apple.mouse.scaling -1

# Copy SF Mono font (available only in Xcode and Terminal.app) to the system
cp -R /System/Applications/Utilities/Terminal.app/Contents/Resources/Fonts/. /Library/Fonts/

# Use VSCode as a git editor, for difftool and mergetool
git config --global core.editor "code --wait"
git config --global merge.tool "vscode"
git config --global mergetool.vscode.cmd "code --wait \$MERGED"
git config --global diff.tool "vscode"
git config --global difftool.vscode.cmd "code --wait --diff \$LOCAL \$REMOTE"

# Remove ALL icons (except Finder) from dock
echo "Removing all icons (except Finder) from the dock…"
defaults write com.apple.dock persistent-apps -array

# List of dock icons
dockIcons=(
    /System/Applications/Utilities/Terminal.app
    /System/Applications/Mail.app
    /System/Applications/Messages.app
    /Applications/Discord.app
    /Applications/Signal.app
    /Applications/Slack.app
    /Applications/Safari.app
    /System/Applications/Music.app
    /Applications/Bear.app
    /Applications/Things3.app
    /System/Applications/Calendar.app
    /Applications/Fork.app
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
    #mint # Dependency manager that installs and runs Swift command-line tool packages
    gnupg # OpenPGP for signing and encrypting
    pinentry-mac # App to use macOS native keychain for PGP passwords
    pandoc # Markup to Word/Open office converter needed by Typora
    git-delta # Language syntax-highlighting for git show / git add -p
#Unused
    # vapor/tap/vapor # backend framework
    # python # Python version 3.7, preinstalled is 2.7
#Dependencies used to create a macOS VM through https://github.com/myspaghetti/macos-virtualbox    
    #bash # newest bash version. System's default is 3
    #coreutils # GNU File, Shell, and Text utilities
    #dmg2img # Utilities for converting macOS DMG images
    #gzip  # Popular GNU data compression program
    #unzip # Extraction utility for .zip compressed archives
    #wget # Internet file retriever
)

# install brew packages
brew install ${brewPackages[@]}

# Setup git-delta
git config --global core.pager "delta --theme='GitHub'"
git config --global interactive.diffFilter "delta --color-only --theme='GitHub'"

# (Use only if you installed Xcode!) As we installed homebrew before Xcode, we need to switch to Xcode Command Line Tools... 
sudo xcode-select -s /Applications/Xcode.app/Contents/Developer

# (use only if you installed Xcode!) ...and delete the other one as described in 
# https://developer.apple.com/library/archive/technotes/tn2339/_index.html#//apple_ref/doc/uid/DTS40014588-CH1-HOW_CAN_I_UNINSTALL_THE_COMMAND_LINE_TOOLS_
sudo rm -rf /Library/Developer/CommandLineTools

# List of mint packages
#mintPackages=(
#    MakeAWishFoundation/SwiftyMocky # Library to autogenerate mocks
#)

#mint install ${mintPackages[@]}

# install CocoaPods dependency manager for iOS apps
sudo gem install cocoapods

# install CocoaPods Keys plugin. WARNING: Problems with ARM CPU!
sudo gem install cocoapods-keys

# install Push Notification sender for APNS v 1.7.5 working with Catalina
cd ~/Downloads/ &&
curl -O -L https://github.com/onmyway133/PushNotifications/releases/download/1.7.5/Push.Notifications-1.7.5-mac.dmg &&
cd - &&
hdiutil attach ~/Downloads/Push.Notifications-1.7.5-mac.dmg &&
cp -a /Volumes/Push\ Notifications\ 1.7.5/Push\ Notifications.app/ /Applications/Push\ Notifications.app &&
hdiutil unmount /Volumes/Push\ Notifications\ 1.7.5/  &&
rm -rf ~/Downloads/Push.Notifications-1.7.5-mac.dmg

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
# WARNING: Do not use this iCloud folder for active development! Store only finished/abandoned projects,
# as changing git branches with thousands of small files will break the synch.

mkdir ~/Library/Mobile\ Documents/com~apple~CloudDocs/Developer
ln -s ~/Library/Mobile\ Documents/com~apple~CloudDocs/Developer ~/Developer\ symlink

# Make pinentry-mac your default pientry choice
echo "pinentry-program $(which pinentry-mac)" >> ~/.gnupg/gpg-agent.conf

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
brew cleanup
rm -rf ~/Library/Caches/Homebrew

# Visual Studio Code setup
# * Disable telemetry
# * Choose SF Mono as a default font
# * Choose white theme and change ANSI bright blue to feel the same as in Terminal.app
# For more see settings.json file
cp ./vscodesettings.json ~/Library/Application\ Support/Code/User/settings.json
