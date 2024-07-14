#!/bin/bash

# Exit on error
set -e

echo "Monitoring Docker containers..."

# Display Docker container status
# ps lists the following:
#   ids
#   images
#   commands
#   creation time
#   status
#   ports 
#   names
docker ps

echo "Monitoring completed successfully!"
