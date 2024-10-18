set -U fish_key_bindings fish_default_key_bindings
set -Ux EDITOR nvim

# ssh-agent
if status is-interactive
    eval (keychain --eval --quiet id_ed25519)
end

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
