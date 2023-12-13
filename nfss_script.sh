#!/bin/bash
#Add key ssh
mkdir -p ~root/.ssh
cp ~vagrant/.ssh/auth* ~root/.ssh
#Install nfs server
apt install -y nfs-kernel-server
#Create the Export Directory
mkdir -p /srv/share/upload
chown -R nobody:nogroup /srv/share
chmod 0777 /srv/share/upload
#Configure the Export Directory
echo "/srv/share 192.168.56.101/32(rw,sync,root_squash)" >> /etc/exports
exportfs -r
#Restart nfs server
systemctl restart nfs-server
