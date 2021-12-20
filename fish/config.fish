if status is-interactive
    # Commands to run in interactive sessions can go here
    function fish_mode_prompt
    end
    function fish_vi_cursor
    end
    set fish_greeting
    set -Ux EDITOR nvim
    set PATH $PATH /home/yash/.local/bin
end
