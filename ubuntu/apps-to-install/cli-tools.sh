#for mint users
sudo mv /etc/apt/preferences.d/nosnap.pref ~/Documents/nosnap.backup
sudo apt update

sudo apt install snapd

sudo snap install intellij-idea-community --channel=2021.3/stable --classic



#vi, only better!!
#sudo apt install vim -y
#
#inspect SSL and other certificates
sudo apt install certtool -y


#pretty print directory structure
sudo apt install tree -y


#helper to alias xdg-open with open
sudo ln -s /usr/bin/xdg-open /usr/bin/open -y


#jsonquery and yamlquery
sudo apt install jq yq -y

#locate to find files
sudo apt install mlocate -y


#instal git open to open repos from cmd
sudo apt install npm
sudo npm install --global git-open -y

#symlink to latest idea
sudo ln -s /snap/intellij-idea-ultimate/current/bin/idea.sh /usr/local/bin/idea -y

#office 365 without distracting browsers
#sudo snap install office365webdesktop --beta -y
#
#pulse audio volument control
#sudo apt install pavucontrol -y


#for xmind 8
sudo apt-get install canberra-gtk-module -y


#clamav
sudo apt install clamav -y


#download rootkit hunter - install this as early as possible to create properties of valid system files
#1st run:
# .rk.update
# .rk.post.check.update.props
# .rk.check

#sudo apt install rkhunter
#
#
#sudo apt install chkrootkit
#

