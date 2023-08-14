#for mint users
sudo mv /etc/apt/preferences.d/nosnap.pref ~/Documents/nosnap.backup
sudo apt update

sudo apt install snapd -y

sudo snap install intellij-idea-ultimate --channel=2021.3/stable --classic

#symlink to latest idea
sudo ln -s /snap/intellij-idea-ultimate/current/bin/idea.sh /usr/local/bin/idea

sudo apt install maven -y

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

#office 365 without distracting browsers
#sudo snap install office365webdesktop --beta -y
#
#pulse audio volument control
#sudo apt install pavucontrol -y


#for xmind 8 (E: Package 'libwebkitgtk-1.0-0' has no installation candidate)
#assuming you already have java 8 - chage the set up instructions from
#apt-get install openjdk-8-jre libgtk2.0-0 libwebkitgtk-1.0-0 lame libc6 libglib2.0-0
#to
apt-get install libgtk2.0-0  lame libc6 libglib2.0-0 libwebkit2gtk-4.0-37 -y

#to launch xmind, add this script in the same directory as it:
#>>>>
#!/bin/bash
(cd /opt/xmind/XMind_amd64 && ./XMind)
#<<<<
#to add to mint menu
#https://softhints.com/linux-mint-how-to-add-desktop-shortcut/

#sudo apt-get install canberra-gtk-module -y


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

