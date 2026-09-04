# core commands that we want to always add flags to
alias ls="ls -F"

# if we need to source something to reload changes to a file, give it a command here
alias edit-aliases="nvim $HOME/.bash_aliases && source $HOME/.bashrc"
alias edit-functions="nvim $HOME/.bash_functions && source $HOME/.bashrc"
alias edit-rc="nvim $HOME/.bashrc && source $HOME/.bashrc"
alias edit-scripts="nvim $HOME/.shell-scripts && source $HOME/.bashrc"
alias edit-config="nvim $HOME/.config && source $HOME/.bashrc"
alias sbrc="source $HOME/.bashrc && source $HOME/.bashrc"

# tracks home folder in a folder called ~/.dotfiles
# from https://www.atlassian.com/git/tutorials/dotfiles
alias git-dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

# couldn't tell you why systemctl commands give my brain specific issues
# but i wouldnt be surprised if other people have aliases for the same things
alias sc="sudo systemctl"
alias sc-user="systemctl --user"

# copy various license files to current directory
# i could see a world where i use enough licenses that this should be a function
# for now, any licenses i use get an alias
alias cp-gpl-license="cp ~/documents/GPL_LICENSE ./LICENSE"
alias cp-mit-license="cp ~/documents/MIT_LICENSE ./LICENSE"

# i hate typing awk syntax. that might be because of my typing habits. that being said:
# i don't really use awk for awk, i use awk with the same few specific commands
# what i really need is a wrapper around awk and not aliases
alias trim-ws="awk '{\$1=\$1};1'"

# why did they not just name it btctl
alias btctl="bluetoothctl"
alias btctl-dev="bluetoothctl devices"
alias btctl-c="bluetoothctl connect"
alias btctl-d="bluetoothctl disconnect"

# i hate google and i want them to not be on my computer 
# if i need to access google i do it through here
alias google-sandbox="firejail --apparmor --seccomp --private=~/google-sandbox librewolf"
