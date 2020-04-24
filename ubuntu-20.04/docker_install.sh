#!/bin/bash
sudo apt-get update
sudo apt-get remove docker docker-engine docker.io
sudo apt install docker.io

# Giving current User non-root access
sudo groupadd docker
sudo gpasswd -a $USER docker
sg docker -c "bash"
