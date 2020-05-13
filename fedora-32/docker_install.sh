#!/bin/bash
sudo tee /etc/yum.repos.d/docker-ce.repo<<EOF
[docker-ce-stable]
name=Docker CE Stable - \$basearch
baseurl=https://download.docker.com/linux/fedora/31/\$basearch/stable
enabled=1
gpgcheck=1
gpgkey=https://download.docker.com/linux/fedora/gpg
EOF

# adding regular to the docker group
sudo groupadd docker
sudo gpasswd -a $USER docker
sg docker -c "bash"

# enabling docker on startup
sudo systemctl enable --now docker

# installing docker compose
sudo dnf -y install docker-compose

# docker container creation has bug on fedora 32
# Temp fix: https://github.com/docker/for-linux/issues/219
sudo mkdir /sys/fs/cgroup/systemd
sudo mount -t cgroup -o none,name=systemd cgroup /sys/fs/cgroup/systemd