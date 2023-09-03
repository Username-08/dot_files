if status is-interactive
    # Commands to run in interactive sessions can go here
    function fish_mode_prompt
    end
    function fish_vi_cursor
    end
    set fish_greeting
    set -Ux EDITOR nvim
    alias nix-shell="nix-shell --command 'fish'"
    set PATH $PATH /home/yash/.local/bin /home/yash/.cargo/bin /home/yash/STMicroelectronics/STM32Cube/STM32CubeProgrammer/bin
end
#
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# if test -f /opt/miniconda3/bin/conda
#     eval /opt/miniconda3/bin/conda "shell.fish" "hook" $argv | source
# end
# <<< conda initialize <<<
