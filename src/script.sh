#!/bin/bash

# Check if the repository is already cloned
if [ -d "./myflix-videos/.git" ]; then
    # If cloned, pull latest changes
    cd myflix-videos && git pull
else
    # Clone repo
    git clone https://github.com/SandSide/myflix-videos.git
fi

# Go to source files
cd myflix-videos/src

# Remove all running contaienrs
docker stop $(docker ps -q)
docker rm $(docker ps -a -q)

# Create new image
docker build -t myflix-videos .

# Run container
docker run -d -p 80:80 --name myflix-vidoes myflix-videos



