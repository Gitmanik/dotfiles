function renode_analyzer --description "analyzer"
    while true
        set port (ss -lntp | grep dotnet | grep -oP '(?<=0.0.0.0:)\d+' | grep -oP '[0-9]{5}' | head -n 1)

        if test -n "$port"
            echo "Connecting to localhost:$port"
            telnet localhost $port
        end

        clear
        figlet -w (tput cols) -c renode_analyzer
        sleep 0.5
    end
end
