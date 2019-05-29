#!/bin/bash
# My setup @bashexplode

# Change default ssh keys
cd /etc/ssh/
mkdir default_kali_keys
mv ssh_host_* default_kali_keys/
dpkg-reconfigure openssh-server
cd ~/

# Remove garbage folders I never use
rm -r ~/Documents/
rm -r ~/Music/
rm -r ~/Pictures/
rm -r ~/Public
rm -r ~/Templates/
rm -r ~/Videos/

# Set up bash prompt
sed -i 's/\${debian_chroot:+($debian_chroot)}\\\[\\033\[01;31m\\\]\\u@\\h\\\[\\033\[00m\\\]:\\\[\\033\[01;34m\\\]\\w\\\[\\033\[00m\\\]\\\$/\\\[\\e\[1;32m\\\]\[\\d \\A\] \${debian_chroot:+(\$debian_chroot)}\\\[\\033\[01;31m\\\]\\u@\\h\\\[\\033\[00m\\\]:\\\[\\033\[01;33m\\\]\\w\\\[\\033\[00m\\\]\\\$/g' ~/.bashrc

# Enable window listing on Desktop
gnome-shell-extension-tool -e window-list@gnome-shell-extensions.gcampax.github.com

# Remove terminal transparency
dconf write /org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/background-transparency-percent 0

# Nautilus default list view
gsettings set org.gnome.nautilus.preferences default-folder-viewer 'list-view'

# Download applications
apt install terminator -y 

# Fix favorites bar
gsettings set org.gnome.shell favorite-apps "['org.gnome.Nautilus.desktop', 'terminator.desktop', 'org.gnome.Terminal.desktop', 'leafpad.desktop', 'firefox-esr.desktop', 'kali-burpsuite.desktop']"

# Make background black
gsettings set org.gnome.desktop.background picture-uri file:///usr/share/gnome-control-center/pixmaps/noise-texture-light.png
gsettings set org.gnome.desktop.background primary-color '#000000'

# Make lock screen black
gsettings set org.gnome.desktop.screensaver picture-uri file:///usr/share/gnome-control-center/pixmaps/noise-texture-light.png
gsettings set org.gnome.desktop.screensaver primary-color '#000000'

# Turn off blank screen timeout
gsettings set org.gnome.desktop.session idle-delay 0

# Disable visual vim
echo "set mouse-=a" >> ~/.vimrc

# Make screen scrollable
echo "termcapinfo xterm* ti@:te@" >> ~/.screenrc

# Make tmux scrollable
echo "set-option -g mouse on" >> ~/.tmux.conf
