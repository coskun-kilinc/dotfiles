set fish_greeting (set_color green)"
 ********   **    ********   **      **
/**/////   /**   **//////   /**     /**
/**        /**  /**         /**     /**
/*******   /**  /*********  /**********
/**////    /**  ////////**  /**//////**
/**        /**         /**  /**     /**
/**        /**   ********   /**     /**
//         //   ////////    //      // 
"
# set fish_greeting ""

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

alias ll "exa -l --group-directories-first --git --icons"
alias lla "exa -la --group-directories-first --git --icons"
alias g git
alias lg lazygit

# >>> functions >>>
alias html-to-md "pbpaste | pandoc -f html -t markdown | pbcopy"

# >>> editor >>>
set -gx EDITOR nvim

# >>> path >>>
set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH

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
