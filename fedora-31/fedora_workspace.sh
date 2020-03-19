#!/bin/bash

# First thing First! Update! Upgrade!
sudo dnf update

################################################
#    SOME TWEAKS AND FIXES                     #
################################################

# Installing Dash to Panel Gnome Shell extension and enabling it
# Moving the Dock From Left (default) to the Bottom
# Enable click to minimize on Ubuntu using command line

################################################
#    DESKTOP ENVIRONMENT                       #
################################################
# gsettings set com.canonical.indicator.datetime custom-time-format '%a %H:%M %p %b %d'
 sudo dnf install -y gnome-tweak-tool 
 
 # org.gnome.shell.extensions.dash-to-dock show-apps-at-top true
 # From Software centre install extension Dash to Panel
 # Install Arch Menu

# I am in love with papirus icon-pack <3 Grab them
sudo dnf install papirus-icon-theme

# Do you text in Bangla? Avro is here!

################################################
#    APPLICATION INSTALLATION                  #
################################################

# Fedora doesn't pack vim. Install vim
sudo dnf install vim-enhanced

# Firfox is not Enough! Download Chrome and install it.

# Installing Oracle JDK8 
# (Assuming its downloaded to ~/apps)
sudo mkdir -p /usr/local/jdk && \
sudo rm -rf /usr/local/jdk/*
sudo tar -zxf ~/apps/jdk-8u*-linux-x64.tar.gz -C /usr/local/jdk && \
sudo mv /usr/local/jdk/jdk1*/* /usr/local/jdk/ && \
sudo echo 'export JAVA_HOME=/usr/local/jdk' >>~/.bashrc && \
sudo echo 'export PATH=$PATH:$JAVA_HOME/bin' >>~/.bashrc && \
source ~/.bashrc

# Tell the system that the new Oracle Java version is available by the following commands
sudo update-alternatives --install "/usr/bin/java" "java" "/usr/local/jdk/bin/java" 1
sudo update-alternatives --install "/usr/bin/javac" "javac" "/usr/local/jdk/bin/javac" 1
sudo update-alternatives --set java /usr/local/jdk/bin/java
sudo update-alternatives --set javac /usr/local/jdk/bin/javac

# Install git and configure
sudo dnf install git-all && \
git config --global user.name "Shafin Mahmud" && \
git config --global user.email shafin.mahmud@gmail.com

# Install gradle and configure
# (Assuming its downloaded to ~/apps)
sudo mkdir -p /usr/local/gradle && \
sudo rm -rf /usr/local/gradle/* && \
sudo unzip ~/apps/gradle-*-bin.zip -d /usr/local/gradle && \
sudo mv /usr/local/gradle/gradle-*/* /usr/local/gradle/ && \
sudo echo 'export GRADLE_HOME=/usr/local/gradle' >>~/.bashrc && \
sudo echo 'export PATH=$PATH:$GRADLE_HOME/bin' >>~/.bashrc && \
source ~/.bashrc

# Install maven and configure
# (Assuming its downloaded to ~/apps)
sudo mkdir -p /usr/local/maven && \
sudo rm -rf /usr/local/maven/* && \
sudo tar -zxf ~/apps/apache-maven-*.tar.gz -C /usr/local/maven && \
sudo mv /usr/local/maven/apache-maven-*/* /usr/local/maven/ && \
sudo echo 'export MAVEN_HOME=/usr/local/maven' >>~/.bashrc && \
sudo echo 'export PATH=$PATH:$MAVEN_HOME/bin' >>~/.bashrc && \
source ~/.bashrc

# Install Nodejs npm and gulp
curl -sL https://rpm.nodesource.com/setup_12.x | sudo bash -
sudo dnf install -y gcc-c++ make
sudo dnf install -y nodejs
sudo npm install -g gulp-cli

# Install VSCode
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc && \
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
sudo dnf update && \
sudo dnf install -y code

# Installing IntellijIDEA
# (Assuming its downloaded to ~/apps)
mkdir -p ~/idea && tar -zxf ~/apps/ideaIU-*.tar.gz -C ~/idea && \
mv ~/idea/idea-IU-*/* ~/idea/ && rm -rf ~/idea/idea-IU-*

# Installing WebStorm
# (Assuming its downloaded to ~/apps)
mkdir -p ~/webstorm && tar -zxf ~/apps/WebStorm-*.tar.gz -C ~/webstorm && \
mv ~/idea/WebStorm-*/* ~/idea/ && rm -rf ~/webstorm/WebStorm-*

# Download and install MySQL and MySQL Workbench
./mysql_install.sh
./mysql_fix.sh

# Installing Docker CE
./docker_install.sh
