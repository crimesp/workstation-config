#chmod
alias .chmod.sh.files.in.this.dir.become.executable="chmod 700 *.sh"
alias .chmod.all.files.set.to.readonly.in.this.dir="chmod 400 *"

alias .chmod.sh.recursive='find . -name "*.sh" -exec chmod 700 {} \;'