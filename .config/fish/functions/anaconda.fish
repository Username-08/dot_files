function anaconda --description 'alias anaconda=eval /opt/miniconda3/bin/conda "shell.fish" hook $argv | source'
    eval /opt/miniconda3/bin/conda "shell.fish" hook $argv | source
end
