if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -U fish_key_bindings fish_default_key_bindings
set -Ux EDITOR nvim

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
set -x PATH $PATH $HOME/.rvm/bin


# aliases
alias l="ls -la"
alias vim="nvim"
alias msfconsole="source ~/.rvm/scripts/rvm && msfconsole"

####### curl to call cheat.rs
function howto
    curl cheat.sh/$argv
end
#######

####### adds starship
starship init fish | source
#######
