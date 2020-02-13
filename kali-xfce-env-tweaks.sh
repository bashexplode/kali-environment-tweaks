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

# Remove terminal transparency and change theme to white on black
sed -i 's/ApplicationTransparency=5/ApplicationTransparency=0/g' ~/.config/qterminal.org/qterminal.ini
sed -i 's/colorScheme=Kali-Dark/colorScheme=WhiteOnBlack/g' ~/.config/qterminal.org/qterminal.ini

# Thunar default list view?

# Download applications
apt install terminator -y 

# Make background black
sudo python -c "from PIL import Image; img = Image.new('RGB', (3840,2160), color='black'); img.save('/usr/share/backgrounds/kali/black.png'); quit();"
xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitor0/image-show -s true
xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitor0/image-path -s /usr/share/backgrounds/kali/black.png
xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitor1/image-path -s /usr/share/backgrounds/kali/black.png
xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitoreDP-1/workspace0/last-image -s /usr/share/backgrounds/kali/black.png
xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitoreDP-1/workspace1/last-image -s /usr/share/backgrounds/kali/black.png

# Make lock screen black
cp /usr/share/backgrounds/kali/kali-light-16x9.png /usr/share/backgrounds/kali/kali-light-16x9.png.bak
cp /usr/share/backgrounds/kali/black.png /usr/share/backgrounds/kali/kali-light-16x9.png

# Disable visual vim
echo "set mouse-=a" >> ~/.vimrc

# Make screen scrollable
echo "termcapinfo xterm* ti@:te@" >> ~/.screenrc

# Make tmux scrollable
echo "set-option -g mouse on" >> ~/.tmux.conf
