#sets USB write buffer to 15MB (less time to wait until USB can be removed)
echo vm.dirty_bytes=15000000 | sudo tee -a /etc/sysctl.conf

#allows more file handles for idea to watch for changes to directories
echo fs.inotify.max_user_watches = 524288 | sudo tee -a /etc/sysctl.conf
