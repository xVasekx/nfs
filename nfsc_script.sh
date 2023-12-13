#!/bin/bash
#Add key ssh
mkdir -p ~root/.ssh
cp ~vagrant/.ssh/auth* ~root/.ssh
#Install nfs client
apt install -y nfs-common
#Add mount directory
echo "192.168.56.100:/srv/share/ /mnt nfs vers=3,proto=udp 0 0" >> /etc/fstab
mount -a

