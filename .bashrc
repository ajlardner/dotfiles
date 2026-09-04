# sourced in .bash_profile, changes made here will affect shells that use it as well

# source .env first, other files depend on variables set there
source ~/.env
# then other bash dotfiles
source ~/.bash_aliases
source ~/.bash_functions
# from https://bash-prompt-generator.org/
# advanced git information in bash prompt, used by PS1
source ~/.shell-scripts/git-prompt.sh

# https://github.com/junegunn/fzf 
# set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"

# from https://web.archive.org/web/20210506080335/https://mah.everybody.org/docs/ssh
SSH_ENV="$HOME/.ssh/agent-environment"

function start_agent {
    echo "Initialising new SSH agent..."
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' >"$SSH_ENV"
    echo succeeded
    chmod 600 "$SSH_ENV"
    . "$SSH_ENV" >/dev/null
    ssh-add .ssh/firelink
}

# Source SSH settings, if applicable

if [ -f "$SSH_ENV" ]; then
    . "$SSH_ENV" >/dev/null
    ps -ef | grep $SSH_AGENT_PID | grep ssh-agent$ >/dev/null || {
        start_agent
    }
else
    start_agent
fi
