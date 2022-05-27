#ubuntu firewall
sudo ufw enable

#vi, only better!!
sudo apt install vim

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


#power / performance control
sudo add-apt-repository ppa:slimbook/slimbook
sudo apt update && sudo apt install slimbookbattery
sudo apt update
sudo apt install slimbookbattery

#jquery and yaml query
sudo apt jq yq

#timers for work, breaks and mini breaks
sudo apt-get install workrave

#locate to find files
sudo apt install mlocate

#instal git open to open repos from cmd
npm install --global git-open
sudo npm install --global git-open

#symlink to latest idea
sudo ln -s /snap/intellij-idea-ultimate/current/bin/idea.sh /usr/local/bin/idea
