# First thing First! Update! Upgrade!
sudo apt-get update && sudo apt-get -y upgrade

################################################
#    SOME TWEAKS AND FIXES                     #
################################################

# Fixing Time problem by keeping RTC in local time 
# (Life saver when setup dual boot with windows 10)
sudo timedatectl set-local-rtc 1 --adjust-system-clock

# Installing ibcanaberra gtk module if missing (for intellijIdea)
sudo apt-get install --reinstall libcanberra-gtk-module

# Installing Dash to Panel Gnome Shell extension and enabling it
sudo apt install gnome-shell-extension-dash-to-panel && \
gnome-shell-extension-tool -e gnome-shell-extension-dash-to-panel

# Moving the Dock From Left (default) to the Bottom
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM

# Enable click to minimize on Ubuntu using command line
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'

# Altering Workspace switch short key cause it conflict with IntelliJ.
# This remove the offending shortcuts completely and allows IntelliJ to use them
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-left "[]"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-right "[]"


################################################
#    DESKTOP ENVIRONMENT                       #
################################################
# gsettings set com.canonical.indicator.datetime custom-time-format '%a %H:%M %p %b %d'
 sudo apt-get install -y gnome-tweak-tool && \
 sudo apt install -y dconf-tools
 
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

# Who doesn't like vim? Install vim
sudo apt-get install -y vim

# I don't know why curl isn't pre-installed? Install curl
sudo apt install -y curl

# I can't live without FB :3 Download Chrome and install it.
sudo mkdir ~/apps && \
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -P ~/apps/ && \
sudo dpkg -i ~/apps/google-chrome-stable_current_amd64.deb

# Download Java from Oracle
sudo wget --no-check-certificate -c --header "Cookie: oraclelicense=accept-securebackup-cookie" \
https://download.oracle.com/otn-pub/java/jdk/8u191-b12/2787e4a523244c269598db4e85c51e0c/jdk-8u191-linux-x64.tar.gz \
-P ~/apps/

# Install and setup JVM
sudo mkdir -p /usr/local/jdk && \
sudo rm -rf /usr/local/jdk/* && \
sudo tar -zxf ~/apps/jdk-8u*-linux-x64.tar.gz -C /usr/local/jdk && \
sudo mv /usr/local/jdk/jdk1*/* /usr/local/jdk/ && \
sudo echo 'export JAVA_HOME=/usr/local/jdk' >>~/.bashrc && \
sudo echo 'export PATH=$PATH:/usr/local/jdk/bin' >>~/.bashrc && \
source ~/.bashrc

# Install git and configure
sudo apt install git && \
git config --global user.name "Shafin Mahmud" && \
git config --global user.email shafin.mahmud@gmail.com

# Install gradle and configure
wget https://gradle.org/next-steps/?version=6.1&format=bin -P ~/apps/ && \
sudo mkdir -p /usr/local/gradle && \
sudo rm -rf /usr/local/gradle/* && \
sudo unzip ~/apps/gradle-*-bin.zip -d /usr/local/gradle && \
sudo mv /usr/local/gradle/gradle-*/* /usr/local/gradle/ && \
sudo echo 'export GRADLE_HOME=/usr/local/gradle' >>~/.bashrc && \
sudo echo 'export PATH=$PATH:/usr/local/gradle/bin' >>~/.bashrc && \
source ~/.bashrc

# Install maven and configure
wget https://www-eu.apache.org/dist/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz -P ~/apps/ && \
sudo mkdir -p /usr/local/maven && \
sudo rm -rf /usr/local/maven/* && \
sudo tar -zxf ~/apps/apache-maven-*.tar.gz -C /usr/local/maven && \
sudo mv /usr/local/maven/apache-maven-*/* /usr/local/maven/ && \
sudo echo 'export MAVEN_HOME=/usr/local/maven' >>~/.bashrc && \
sudo echo 'export PATH=$PATH:/usr/local/maven/bin' >>~/.bashrc && \
source ~/.bashrc

# Install ANT and configure
sudo mkdir -p /usr/local/ant && \
sudo rm -rf /usr/local/ant/* && \
sudo tar -zxf ~/apps/apache-ant-*.tar.gz -C /usr/local/ant && \
sudo mv /usr/local/ant/apache-ant-*/* /usr/local/ant/ && \
sudo echo 'export ANT_HOME=/usr/local/ant' >>~/.bashrc && \
sudo echo 'export PATH=$PATH:$ANT_HOME/bin' >>~/.bashrc && \
source ~/.bashrc

# Install Nodejs npm and gulp
curl -sL https://deb.nodesource.com/setup_10.x | sudo bash -
sudo apt install nodejs
sudo npm install --global gulp-cli

# Install VSCode
sudo wget https://go.microsoft.com/fwlink/?LinkID=760868 -O ~/apps/vs_code_64.deb && \
sudo dpkg -i ~/apps/vs_code_64.deb && sudo apt-get install -f

# Installing IntellijIDEA 2019.3.2
wget https://download.jetbrains.com/idea/ideaIU-2018.3.tar.gz P ~/apps/ && \
mkdir -p ~/idea && tar -zxf ~/apps/ideaIU-*.tar.gz -C ~/idea && \
mv ~/idea/idea-IU-*/* ~/idea/ && rm -rf ~/idea/idea-IU-*

# Installing WebStorm 2019.3.2
wget https://download-cf.jetbrains.com/webstorm/WebStorm-2019.3.2.tar.gz P ~/apps/ && \
mkdir -p ~/webstorm && tar -zxf ~/apps/WebStorm-*.tar.gz -C ~/webstorm && \
mv ~/idea/WebStorm-*/* ~/idea/ && rm -rf ~/webstorm/WebStorm-*

# # Creating Idea shortcut
# [Desktop Entry]
# Version=1.0
# Name=IntellijIDEA
# Exec=/home/shafin/ide/idea/bin/idea
# Path=/home/shafin/ide/idea/
# Icon=/home/shafin/ide/idea/bin/idea.svg
# Terminal=false
# Type=Application
# Categories=Utility;Development;

# Download and install MySQL and MySQL Workbench
./mysql_install.sh
./mysql_fix.sh

# Installing Docker
sudo apt-get install -y apt-transport-https ca-certificates  curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update && sudo apt-get install -y docker-ce

# Make Menu Bar Favourite short cuts
dconf write /org/gnome/shell/favorite-apps \
"['org.gnome.Nautilus.desktop', 'org.gnome.Software.desktop', 'org.gnome.Terminal.desktop', 'google-chrome.desktop', 'code.desktop', 'mysql-workbench.desktop']"
