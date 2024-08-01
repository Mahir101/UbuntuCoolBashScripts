#!/bin/bash

check_and_restart_containers() {
    stopped_containers=$(docker ps -a --filter "status=exited" --format "{{.ID}}")
    if [ ! -z "$stopped_containers" ]; then
        for container in $stopped_containers; do
            echo "Restarting container $container..."
            docker start $container
        done
    else
        echo "No stopped containers found."
    fi
}

while true; do
    check_and_restart_containers
    sleep 300
done
