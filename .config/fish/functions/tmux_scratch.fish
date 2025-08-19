function tmux_scratch --description "tmux popup" --argument-names session_name command
    if [ "$(tmux display-message -p -F "#{session_name}")" = $argv[1] ]
        tmux detach-client
    else
        tmux popup -w80% -h80% -E "tmux attach -t $argv[1] || tmux new -s $argv[1] $argv[2]"
    end
end
