# set fish_greeting (set_color green)"
#  ********   **    ********   **      **
# /**/////   /**   **//////   /**     /**
# /**        /**  /**         /**     /**
# /*******   /**  /*********  /**********
# /**////    /**  ////////**  /**//////**
# /**        /**         /**  /**     /**
# /**        /**   ********   /**     /**
# //         //   ////////    //      // 
# "
set fish_greeting ""

set -gx TERM xterm-256color

alias ll "exa -l --icons"
alias lla "ll -a"

# >>> theme >>>

set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

# >>> aliases >>>
alias ls "ls -p -G"
alias la "ls -A"
alias ll "ls -l"
alias lla "ll -A"
alias g git
command -qv nvim && alias vim nvim

set -gx EDITOR nvim

set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH

if status is-interactive
    # Commands to run in interactive sessions can go here
end

# >>> add brew to path >>>

eval "$(/opt/homebrew/bin/brew shellenv)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /opt/homebrew/Caskroom/miniconda/base/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
  source $LOCAL_CONFIG
end
