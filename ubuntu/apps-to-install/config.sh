#ubuntu firewall
sudo ufw enable


#sets USB write buffer to 15MB (less time to wait until USB can be removed)
echo vm.dirty_bytes=15000000 | sudo tee -a /etc/sysctl.conf

#allows more file handles for idea to watch for changes to directories
echo fs.inotify.max_user_watches = 524288 | sudo tee -a /etc/sysctl.conf



#if you have single display (laptop screen disabled, and you want to lock it for log in)
sudo cp ~/.config/monitors.xml ~gdm/.config/monitors.xml && sudo chown gdm:gdm ~gdm/.config/monitors.xml

#remove background image of desktop
gsettings set org.gnome.desktop.background picture-options 'none'

#optional color setting
gsettings set org.gnome.desktop.background primary-color 'rgb(66, 81, 100)'

