MACHINES = {
  :"nfs" => {
              :box_name => "generic/debian10",
              :box_version => "4.3.6",
              :cpus => 1,
              :memory => 1024,
             
            },
          }

Vagrant.configure("2") do |config|
  MACHINES.each do |boxname, boxconfig|
    config.vm.synced_folder ".", "/vagrant", disabled: true
    config.vm.define "nfss" do |nfss|
      nfss.vm.box = boxconfig[:box_name]
      nfss.vm.box_version = boxconfig[:box_version]
      nfss.vm.host_name = "nfss"
      nfss.vm.network "private_network", ip: "192.168.56.100", virtualbox__intnet: "net1"
      nfss.vm.provider "virtualbox" do |vb|
        vb.memory = boxconfig[:memory]
        vb.cpus = boxconfig[:cpus]
      end
      nfss.vm.provision "shell", path: "nfss_script.sh"
#      nfss.vm.provision "shell", inline: <<-SHELL
#            mkdir -p ~root/.ssh
#            cp ~vagrant/.ssh/auth* ~root/.ssh
#            apt install -y nfs-kernel-server
#            mkdir -p /srv/share/upload
#            chown -R nobody:nogroup /srv/share
#            chmod 0777 /srv/share/upload
#            echo "/srv/share 192.168.56.101/32(rw,sync,root_squash)" >> /etc/exports
#            exportfs -r
#            systemctl restart nfs-server
#          SHELL

    end
    config.vm.define "nfsc" do |nfsc|
      nfsc.vm.box = boxconfig[:box_name]
      nfsc.vm.box_version = boxconfig[:box_version]
      nfsc.vm.host_name = "nfsc"
      nfsc.vm.network "private_network", ip: "192.168.56.101", virtualbox__intnet: "net1"
      nfsc.vm.provider "virtualbox" do |vb|
        vb.memory = boxconfig[:memory]
        vb.cpus = boxconfig[:cpus]
      end
      nfsc.vm.provision "shell", path: "nfsc_script.sh"
#      nfsc.vm.provision "shell", inline: <<-SHELL
#            mkdir -p ~root/.ssh
#            cp ~vagrant/.ssh/auth* ~root/.ssh
#            apt install -y nfs-common
#            echo "192.168.56.100:/srv/share/ /mnt nfs vers=3,proto=udp 0 0" >> /etc/fstab
#            mount -a
#          SHELL
    end
  end
end
