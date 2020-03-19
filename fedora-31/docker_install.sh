#!/bin/bash
sudo dnf config-manager --add-repo=https://download.docker.com/linux/fedora/docker-ce.repo && \
sudo dnf check-update && \
sudo dnf install -y docker-ce

# adding regular to the docker group
sudo usermod -aG docker $USERNAME