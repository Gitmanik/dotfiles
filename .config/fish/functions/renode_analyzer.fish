function renode_analyzer --description "analyzer"
    while true
        set port (ss -lntp | grep dotnet | grep -oP '(?<=0.0.0.0:)\d+' | head -n 1)

        if test -n "$port"
            echo "Connecting to localhost:$port"
            telnet localhost $port
        end

        sleep 0.5
    end
end
