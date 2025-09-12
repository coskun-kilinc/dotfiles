set fish_greeting (set_color green)"
░▀█▀░░░█░▒█░█▀▀░█▀▀░░░█▀▀▄░█▀▀░▄▀▀▄░▄░░░▄░░▀░░█▀▄▀█░░░█▀▀▄░▀█▀░█░░░█
░▒█░░░░█░▒█░▀▀▄░█▀▀░░░█░▒█░█▀▀░█░░█░░█▄█░░░█▀░█░▀░█░░░█▀▀▄░░█░░▀▄█▄▀
░▄█▄░░░░▀▀▀░▀▀▀░▀▀▀░░░▀░░▀░▀▀▀░░▀▀░░░░▀░░░▀▀▀░▀░░▒▀░░░▀▀▀▀░░▀░░░▀░▀░
"
set -gx TERM xterm-256color

# >>> theme >>>
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

# >>> aliases >>>
alias ls "ls -p -G"
alias la "ls -A"
alias ll "lsd -l --group-directories-first --git"
alias lla "lsd -la --group-directories-first --git"

# >>> easy access to obsidian vault
alias obs="nvim ~/Library/Mobile\ Documents/iCloud~md~obsidian/Documents/Obsidian\ Vault"

# >>> git aliases >>>
alias g git
alias lg lazygit
alias gst "git status -sb"
alias gco "git switch"
alias gcm "git commit -m"
alias gca "git commit --amend"
alias gco "git switch"
alias gwt "git worktree"
alias gpl "git pull --rebase"
alias grs "git restore"

# >>> don't tell anyone that I dabble in emacs >>>
alias emacs "emacsclient -t -a ''"

# >>> editor >>>
set -gx EDITOR nvim

# >>> fzf >>>
alias fzf "fzf --preview 'bat --color=always --style=header,grid --line-range :500 {}'"

# >>> path >>>
set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH
set -gx PATH /Applications/Emacs.app/Contents/MacOS/bin $PATH
set -gx PATH /Applications/Emacs.app/Contents/MacOS/libexec $PATH
set -gx PATH /Applications/Emacs.app/Contents/MacOS $PATH


# >>> set up dotfiles >>>
set -x STOW_DIR ~/.dotfiles

if status is-interactive
    # >>> conda initialize >>>
    # !! Contents within this block are managed by 'conda init' !!
    eval /opt/homebrew/Caskroom/miniconda/base/bin/conda "shell.fish" "hook" $argv | source
    # <<< conda initialize <<<
end

# >>> add brew to path >>>
eval "$(/opt/homebrew/bin/brew shellenv)"

set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
  source $LOCAL_CONFIG
end
