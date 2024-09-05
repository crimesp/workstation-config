#change your default shell to bash - https://www.howtogeek.com/444596/how-to-change-the-default-shell-to-bash-in-macos-catalina/

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



#long hold comand for all shortcuts
https://www.mediaatelier.com/CheatSheet/



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
