# This script will run a setup, installing your preferred version of iTerm2, the latest version of Java, and python3, aliasing it to py.
echo "This script will accept the xcodebuild license, and then prompt you to install command line tools from xcode."

sudo xcodebuild -license accept
xcode-select --install

echo "Type the latest version of iTerm2 that you wish to install, followed by [Enter]:"

read version

version=${version//./_}
curl -O https://iterm2.com/downloads/stable/iTerm2-$version.zip
unzip iTerm2-$version.zip
rm iTerm2-$version.zip
# Replace with Applications once done testing!
mv iTerm.app ~/Applications/iTerm.app

echo "Download the latest JDK and then open up iTerm and run . setup2.sh. This is where the majority of the setup scripts will run"
