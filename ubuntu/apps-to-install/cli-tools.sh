#vi, only better!!
sudo apt install vim

#multi terminal panels!"
sudo apt-get install terminator

#for rare cases (such as Flutter version Manager)
sudo apt-get install brew

#dont use brew as sudo
#brew install fvm
brew tap leoafarias/fvm
brew install fvm

#brew install mason
brew tap felangel/mason
brew install mason


sudo apt-get install gnome-panel

 sudo apt-get install gnome-tweak-tool

#inspect SSL and other certificates
sudo apt install certtool


#pretty print directory structure
sudo apt install tree

#shows cpu and memory etc in top bar -  configure as per https://askubuntu.com/questions/406204/how-can-i-add-the-current-cpu-usage-to-my-menu-bar-as-a-percentage
sudo apt install indicator-multiload

#temp monitor
sudo apt install psensor


#helper to alias xdg-open with open
sudo ln -s /usr/bin/xdg-open /usr/bin/open


#power / performance control (possible not needed in modern ubuntu)
sudo add-apt-repository ppa:slimbook/slimbook
sudo apt update && sudo apt install slimbookbattery
sudo apt update
sudo apt install slimbookbattery

#jsonquery and yamlquery
sudo apt install jq yq

#locate to find files
sudo apt install mlocate

#instal git open to open repos from cmd
sudo npm install --global git-open

#symlink to latest idea
sudo ln -s /snap/intellij-idea-ultimate/current/bin/idea.sh /usr/local/bin/idea

#office 365 without distracting browsers
sudo snap install office365webdesktop --beta

#pulse audio volument control
sudo apt install pavucontrol


#for xmind 8
sudo apt-get install canberra-gtk-module
