#!/bin/bash

# Exit on error
set -e

# this bash script will stop all running containers

echo "Stopping all running Docker containers..."

# Get the list of running container IDs
CONTAINERS=$(docker ps -q)

# Check if there are any running containers
if [ -n "$CONTAINERS" ]; then
    docker stop $CONTAINERS
    echo "All running containers have been stopped."
else
    echo "No running containers to stop."
fi
