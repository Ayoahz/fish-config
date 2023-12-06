if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting ""

set -gx TERM xterm-256color

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname yes
set -g theme_hostname always

# aliases
## list
alias ls "eza --icons --sort type"
alias la "eza -l -g -a --icons --sort type"
alias ll "eza -l -g --icons --sort type"
alias lla "ll -a --sort type"
alias lz "eza --tree --icons --sort type"
alias lza "eza --tree -a --icons --sort type"
## git
alias g git
alias gs "git status"
alias gc "git commit"
alias gd "git diff"
alias gp "git push"
## sudoedit
alias svim sudoedit
command -qv nvim && alias vim nvim

# EDITOR
set -gx EDITOR nvim

# PATH
set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH

# NodeJS
set -gx PATH node_modules/.bin $PATH

# Go
set -g GOPATH $HOME/go
set -gx PATH $GOPATH/bin $PATH

# GHQ
set -gx GHQ_ROOT $HOME/repo

# NVM
function __check_rvm --on-variable PWD --description 'Do nvm stuff'
    status --is-command-substitution; and return

    if test -f .nvmrc; and test -r .nvmrc
        nvm use
    else
    end
end

set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
    source $LOCAL_CONFIG
end
