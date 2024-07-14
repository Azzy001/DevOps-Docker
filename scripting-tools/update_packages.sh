#!/bin/bash

# This script will update Docker to the latest version.

# exit on error
set -e

echo "Updating Docker to the latest version..."

# update docker
sudo apt-get update
sudo apt-get upgrade -y docker-ce