#!/bin/bash

# Exit on error
set -e

# Clear the terminal screen for a clean output
clear

# Print a header for the Docker service status check
echo ""
echo "=============================="
echo "   Docker Service Status"
echo "=============================="

# Check Docker service status
echo ""
echo "Checking Docker service status..."
echo "--------------------------------"
sudo systemctl status docker --no-pager
echo ""

# Print a header for the running Docker containers
echo "=============================="
echo "   Running Docker Containers"
echo "=============================="

# List running Docker containers
echo ""
echo ""
echo "Listing running Docker containers..."
echo "--------------------------------------"
docker ps
echo ""

# Final message
echo ""
echo "=============================="
echo " Docker Service Status and Running Containers Listed."
echo "=============================="
