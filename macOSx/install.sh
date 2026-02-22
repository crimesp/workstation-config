#change your default shell to bash: - https://www.howtogeek.com/444596/how-to-change-the-default-shell-to-bash-in-macos-catalina/
brew install bash
sudo bash -c 'echo /opt/homebrew/bin/bash >> /etc/shells'
chsh -s /opt/homebrew/bin/bash



#create bash profile (for login shells) to alias bashrc
nano ~/.bash_profile

#with these contents
source ~/.bashrc

#make sure it sources bash_aliases as per instructions in bash/._readme-FIRST!


#install homebrew from https://brew.sh/
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
#paste in the commmands as prompted at the end of the installer



#multi panel shell like linux terminator
brew install --cask iterm2

#turn on autocomplete
#Open up your terminal
#Enter the command sudo nano ~/.inputrc and enter your password when prompted
#Paste the following commands one at a time

set completion-ignore-case on
set show-all-if-ambiguous on
TAB: menu-complete


#after flutter & xcode installed


#to get past the error "Podfile missing"
sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer



brew install openssl
brew install python
 pip install dmgbuild

#open vpn cli
brew install openvpn
ln -s /opt/homebrew/opt/openvpn/sbin/openvpn /opt/homebrew/bin

--data-ciphers AES-192-CBC


brew install git-open


#update ~.inputrc to read the following to enable showing possible matches, rather than selecting first match
set completion-ignore-case on
set show-all-if-ambiguous on
set menu-complete-display-prefix on
#TAB: menu-complete
set colored-completion-prefix on
set colored-stats on

echo "alias adb='/Users/paulcrimes/Library/Android/sdk/platform-tools/adb'" >> ~/.bash_aliases

#install latest bash and set as default shell
brew update && brew install bash
cat /etc/shells
echo "/opt/homebrew/bin/bash" | sudo tee -a /etc/shells
chsh -s /opt/homebrew/bin/bash
history
brew install bash-completionv2
brew install bash-completion@2
#echo 'if [ -f "$(brew --prefix)/etc/bash_completion" ]; then . "$(brew --prefix)/etc/bash_completion"; fi' >> ~/.bash_profile

echo '[[ -r "$(brew --prefix)/etc/profile.d/bash_completion.sh" ]] && . "$(brew --prefix)/etc/profile.d/bash_completion.sh" ' >> ~/.bash_profile