function fish_prompt --description 'Write out the prompt'
    set -l laststatus $status

    set -l git_info
    if set -l git_branch (command git symbolic-ref HEAD 2>/dev/null | string replace refs/heads/ '')
        set git_branch (set_color -o brown)"$git_branch"
        set git_info "($git_branch"(set_color brown)")"
    end

    # Disable PWD shortening by default.
    set -q fish_prompt_pwd_dir_length
    or set -lx fish_prompt_pwd_dir_length 0

    if test $git_branch
        set prompt_color brown
    else
        set prompt_color green
    end
    # set_color -b black
    printf '%s%s%s%s%s%s%s%s%s%s%s%s%s' (set_color -o $prompt_color) '╭' (set_color brown) $git_info (set_color green) $USER @ $hostname (set_color white) ':' (set_color blue) (prompt_pwd) (set_color $prompt_color)

    if test $laststatus -eq 0
        # printf "%s%s%s " (set_color -o green) (set_color white) (set_color normal)
        printf "\n"
        printf "╰\$ "
    else
        printf ' %s✘%s' (set_color -o red) (set_color $prompt_color)
        printf "\n"
        printf "╰\$ "
    end
end
