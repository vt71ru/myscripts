!#/usr/bin/env  bash
echo "Install some component"
apt install mc vim sudo minidlna vsftpd php python
echo "Add user to sudo group"
echo "Enter user name who added to sudo group"
read name
usermod -aG sudo $name
echo "Save the original minidlna.conf"
cp /etc/minidlna.conf /etc/minidlna.conf.orig
echo "Set the path to the folder with your files"
read paths
sudo vim /etc/minidlna.conf
echo "Check acess for folder...."
sudo -u minidlna ls -l $paths
sudo systemctl start minidlna
sudo systemctl status minidlna
echo "Check if the port is listening..."
sudo ss -4lnp | grep minidlna
