# Change the ownership of /usr/local/lib/pkgconfig to your user (needed for mas to work)
sudo chown -R $(whoami) /usr/local/lib/pkgconfig 

# Fix Carthage
sudo xcode-select -s /Applications/Xcode.app/Contents/Developer

# Fix brew
str1="$(brew doctor)"
str2="/usr/local/lib/pkgconfig"
str3="Your system is ready to brew."

if [[ "$str1" == "$str3" ]]; then
    echo "All good, move on"
else
    if [[ "$str1" == *"$str2"* ]]; then
    	echo "fixing owner of /usr/local/lib/pkgconfig …"
		sudo chown -R $(whoami) /usr/local/lib/pkgconfig 
	else
    	echo "write 'brew doctor' and fix issues manually!"
	fi
fi
