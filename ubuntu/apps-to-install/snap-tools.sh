#for mint users
sudo mv /etc/apt/preferences.d/nosnap.pref ~/Documents/nosnap.backup


sudo apt install snapd -y

sudo snap install intellij-idea-ultimate --channel=2021.3/stable --classic

#symlink to latest idea
sudo ln -s /snap/intellij-idea-ultimate/current/bin/idea.sh /usr/local/bin/idea

#android studio snap
sudo snap install android-studio --classic
snap alias android-studio studio
10
