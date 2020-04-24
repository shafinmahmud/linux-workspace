#!/bin/bash

# First thing First! Update! Upgrade!
sudo apt-get update && sudo apt-get -y upgrade

# Missing utilities
sudo apt-get install -y vim
sudo apt install -y curl
sudo apt install -y xclip
sudo apt install -y htop

################################################
#       SOME TWEAKS AND FIXES                  #
################################################

# Setting Locale and Region format to US
sudo update-locale LC_TIME=en_US.UTF-8

# Setting the 12H time format on the panel
gsettings set org.gnome.desktop.interface clock-format 12h

# Fixing Time problem by keeping RTC in local time 
# (Life saver when setup dual boot with windows 10)
sudo timedatectl set-local-rtc 1 --adjust-system-clock

# Installing ibcanaberra gtk module if missing (for intellijIdea)
sudo apt-get install --reinstall libcanberra-gtk-module

# Installing Dash to Panel Gnome Shell extension and enabling it
# sudo apt install gnome-shell-extension-dash-to-panel && \
# gnome-extensions -e gnome-shell-extension-dash-to-panel

# Moving the Dock From Left (default) to the Bottom
# gsettings set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM

# Enable click to minimize on Ubuntu using command line
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'

# Altering Workspace switch short key cause it conflict with IntelliJ.
# This remove the offending shortcuts completely and allows IntelliJ to use them
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-left "[]"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-right "[]"


################################################
#       DESKTOP ENVIRONMENT                    #
################################################
# gsettings set com.canonical.indicator.datetime custom-time-format '%a %H:%M %p %b %d'
 sudo apt-get install -y gnome-tweak-tool && \
 sudo apt install -y dconf-editor
 
 # org.gnome.shell.extensions.dash-to-dock show-apps-at-top true
 # From Software centre install extension Dash to Panel
 # Install Arch Menu

# I am in love with papirus icon-pack <3 Grab them
sudo add-apt-repository ppa:papirus/papirus && \
sudo apt-get update && \
sudo apt-get install papirus-icon-theme

# Do you text in Bangla? Avro is here!
sudo wget https://github.com/maateen/avro/releases/download/v2.1/avro_2.1-3_all.deb -O ~/apps/avro_21.deb && \
sudo dpkg -i ~/apps/avro_21.deb && sudo apt-get install -f


################################################
#    APPLICATION INSTALLATION                  #
################################################

# Download Chrome and install it.
sudo mkdir -p ~/apps && \
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -P ~/apps/ && \
sudo dpkg -i ~/apps/google-chrome-stable_current_amd64.deb

# Install and setup JVM
# (Assuming its downloaded to ~/apps)
sudo mkdir -p /usr/local/jdk && \
sudo rm -rf /usr/local/jdk/* && \
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
sudo apt install -y git && \
git config --global user.name "Shafin Mahmud" && \
git config --global user.email shafin.mahmud@gmail.com
git config --global core.editor "vim"

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

# Install ANT and configure
# (Assuming its downloaded to ~/apps)
sudo mkdir -p /usr/local/ant && \
sudo rm -rf /usr/local/ant/* && \
sudo tar -zxf ~/apps/apache-ant-*.tar.gz -C /usr/local/ant && \
sudo mv /usr/local/ant/apache-ant-*/* /usr/local/ant/ && \
sudo echo 'export ANT_HOME=/usr/local/ant' >>~/.bashrc && \
sudo echo 'export PATH=$PATH:$ANT_HOME/bin' >>~/.bashrc && \
source ~/.bashrc

# Install Nodejs npm and gulp
curl -sL https://deb.nodesource.com/setup_10.x | sudo bash -
sudo apt-get install -y nodejs
sudo npm install -g bower
sudo npm install --global gulp-cli

# Install VSCode
sudo wget https://go.microsoft.com/fwlink/?LinkID=760868 -O ~/apps/vs_code_64.deb && \
sudo dpkg -i ~/apps/vs_code_64.deb && sudo apt-get install -f

# Installing IntellijIDEA 2020
wget https://download.jetbrains.com/idea/ideaIU-2018.3.tar.gz P ~/apps/ && \
mkdir -p ~/idea && tar -zxf ~/apps/ideaIU-*.tar.gz -C ~/idea && \
mv ~/idea/idea-IU-*/* ~/idea/ && rm -rf ~/idea/idea-IU-*

# Installing WebStorm 2020
wget https://download-cf.jetbrains.com/webstorm/WebStorm-2019.3.2.tar.gz P ~/apps/ && \
mkdir -p ~/webstorm && tar -zxf ~/apps/WebStorm-*.tar.gz -C ~/webstorm && \
mv ~/idea/WebStorm-*/* ~/idea/ && rm -rf ~/webstorm/WebStorm-*

# Download and install MySQL and MySQL Workbench
./mysql_install.sh
./mysql_fix.sh

# Installing Docker
sudo apt install docker.io
sudo systemctl enable --now docker
sudo usermod -aG docker $USER

