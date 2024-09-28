if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting "Get shit done!"
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

####### SSH agent setup for Fish shell
#if test -f "$XDG_RUNTIME_DIR/ssh-agent.env"
#    # Read the file and set environment variables manually, skipping lines without "="
#    for line in (cat $XDG_RUNTIME_DIR/ssh-agent.env)
#        # Only process lines that contain '='
#        if string match -r '^[A-Za-z_][A-Za-z0-9_]*=.*' $line
#            set key (echo $line | cut -d '=' -f 1)
#            set value (echo $line | cut -d '=' -f 2 | cut -d ';' -f 1)
#
#            # Export the variable
#            set -x $key $value
#        end
#    end
#end
#######

####### adds starship
starship init fish | source
#######
