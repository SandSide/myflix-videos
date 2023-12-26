#!/bin/bash
echo 'Running Script'

# Check if the repository is already cloned
if [ -d "./myflix-videos/.git" ]; then

    echo 'Pulling github repo'
    # If cloned, pull latest changes
    cd myflix-videos && git pull
else
    # Clone repo
    echo 'Cloning github repo'
    git clone --branch cloud-deploy https://github.com/SandSide/myflix-videos.git
fi

# Go to source files
cd myflix-videos/src

echo 'Removing all docker containers'
# Remove all running contaienrs
docker stop $(docker ps -q)
docker rm $(docker ps -a -q)

echo 'Attempt to build a new image'
# Create new image
docker build -t myflix-videos .

echo 'Run container'
# Run container
docker run -d -p 80:80 --name myflix-vidoes myflix-videos