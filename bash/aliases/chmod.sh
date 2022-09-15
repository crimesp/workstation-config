#chmod
alias .chmod_sh_files_in_this_dir_become_executable="chmod 700 *.sh"
alias .chmod_all_files_set_to_readonly_in_this_dir="chmod 400 *"

alias .chmod_sh_recursive='find . -name "*.sh" -exec chmod 700 {} \;'