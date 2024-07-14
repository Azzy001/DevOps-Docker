#!/bin/bash

# This script handles the following:
# removing containers
# images
# cleaning up volumes
# networks
# dangling images.


# Exit on error
set -e

# Function to print a header message
print_header() {
    echo "====================================="
    echo "$1"
    echo "====================================="
}

# Check Docker service status
print_header "Checking Docker Service Status"
sudo systemctl is-active --quiet docker && echo "Docker service is running." || { echo "Docker service is not running. Please start Docker first."; exit 1; }

print_header "Starting Docker Cleanup Process"

# Stop all running Docker containers
print_header "Stopping All Running Docker Containers"
if [ "$(docker ps -q)" ]; then
    docker stop $(docker ps -q)
    echo "Stopped all running Docker containers."
else
    echo "No running Docker containers found."
fi

# Remove all Docker containers (both running and stopped)
print_header "Removing All Docker Containers"
if [ "$(docker ps -aq)" ]; then
    docker rm -f $(docker ps -aq)
    echo "Removed all Docker containers."
else
    echo "No Docker containers found to remove."
fi

# Remove all Docker images
print_header "Removing All Docker Images"
if [ "$(docker images -q)" ]; then
    docker rmi -f $(docker images -q)
    echo "Removed all Docker images."
else
    echo "No Docker images found to remove."
fi

# Remove all unused Docker volumes
print_header "Removing All Unused Docker Volumes"
docker volume prune -f
echo "Removed all unused Docker volumes."

# Remove all unused Docker networks
print_header "Removing All Unused Docker Networks"
docker network prune -f
echo "Removed all unused Docker networks."

# Remove dangling Docker images
print_header "Removing Dangling Docker Images"
docker image prune -f
echo "Removed dangling Docker images."

# Remove all unused Docker objects
print_header "Removing Unused Docker Objects"
docker system prune -f
echo "Removed unused Docker objects."

print_header "Docker Cleanup Process Completed"
