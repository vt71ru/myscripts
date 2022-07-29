#!/usr/bin/env  bash
echo -e "Edit sources.list"
sed -i "s|deb https://deb.debian.org/debian/ bullseye main non-free contrib|deb https://deb.debian.org/debian/ unstable main contrib non-free|"
sed -i "s|deb-src https://deb.debian.org/debian/ bullseye main non-free contrib|deb-src https://deb.debian.org/debian/ unstable main contrib non-free|"
sed "6,16d" /etc/apt/sources.list
sed "3d" /etc/apt/sources.list
clear
cat /etc/apt/sources.list
