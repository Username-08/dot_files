if status is-interactive
    # Commands to run in interactive sessions can go here
    function fish_mode_prompt
    end
    function fish_vi_cursor
    end
    set fish_greeting
    set -Ux EDITOR nvim
    set PATH $PATH /home/yash/.local/bin /home/yash/.cargo/bin
end
#
# # >>> conda initialize >>>
# # !! Contents within this block are managed by 'conda init' !!
# eval /opt/miniconda3/bin/conda "shell.fish" hook $argv | source
# # <<< conda initialize <<<
