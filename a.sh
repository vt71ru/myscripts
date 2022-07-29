!#/usr/bin/env  bash
echo "Install some component"
apt -y install gnupg2 xserver-xorg-core xinit xserver-xorg-video-amdgpu xserver-xorg-input-evdev x11-xkb-utils x11-utils x11-xserver-utils xfonts-terminus mc 
apt -y install vim sudo rxvt-unicode minidlna vsftpd php python3
apt -y install i3 lightdm slick-greeter lightdm-settings lxappearance nitrogen gvfs thunar ntfs-3g firefox firefox-l10n-ru alsa-tools alsa-utils arc-theme
dpkg-reconfigure -plow console-setup
echo "Add user to sudo group"
echo "Enter user name who added to sudo group"
read name
usermod -aG sudo $name
echo -e "Sublime text........."
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
apt-get update
apt-get upgrade
sudo systemctl enable lightdm
echo "==================================="
echo "mount NTFS directory"
mkdir /mnt/LIB 
chown -R $name:$name  /mnt/LIB
vim /etc/fstab
echo "==================================="
echo "Save the original minidlna.conf"
cp /etc/minidlna.conf /etc/minidlna.conf.orig
echo "Set the path to the folder with your files"
read paths
sudo vim /etc/minidlna.conf
echo "Check acess for folder...."
sudo -u minidlna ls -l $paths
sudo systemctl enable minidlna
sudo systemctl status minidlna
echo "Check if the port is listening..."
sudo ss -4lnp | grep minidlna

echo "===================================="
echo "Save the original vsftpd.conf"
echo "Enter user name for work with FTP"
read fname
adduser $fname

mkdir -p /home/$fname/ftp-dir
chmod -R 750 /home/$fname/ftp-dir
chown -R $fname:  /home/$fname/ftp-dir
ln -s /home/$fname/ftp-dir/ /mnt/LIB

echo $fname >> /etc/vsftpd.userlist
cp /etc/vsftpd.conf /etc/vsftpd.conf.orig
systemctl enable vsftpd.service
