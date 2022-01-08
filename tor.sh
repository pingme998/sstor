#!/bin/bash
command="tor"
log="prog.log"
match="Bootstrapped 100% (done): Done"

$command > "$log" 2>&1 &
pid=$!

while sleep 1
do
    if fgrep --quiet "$match" "$log"
    then
        date >>date
        cat date
        proxychains4 bash /entrypoint.sh
    fi
done
