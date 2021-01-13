# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|


  config.vm.provision "shell", inline: "echo inicio ..."

  config.vm.define "vm1" do |vm1|
    vm1.vm.box = "hashicorp/bionic64"
    vm1.vm.hostname = "rundeck"
    vm1.vm.network "forwarded_port", guest: 4440 , host: 4440 
    vm1.vm.network "private_network", ip: "192.168.124.100"
    vm1.vm.provision "shell", path: "requirements_vm1.sh"

    vm1.vm.provider "virtualbox" do |vb|
      # Customize the amount of memory on the VM:
      vb.memory = 2048
      vb.cpus = 2
      vb.name ="rundeck"
    end
  end



  config.vm.define "vm2" do |vm2|
    vm2.vm.box = "hashicorp/bionic64"
    vm2.vm.hostname = "mongo"
    vm2.vm.network "forwarded_port", guest: 8080 , host: 8080
    #agregar el root path como folder compartido en la ruta /vagrant
    vm2.vm.synced_folder ".", "/vagrant", disabled: false
    #vm1.vm.network "private_network", ip: "192.168.124.100"
    vm2.vm.provision "file", source: "download-latest-JHU.sh", destination: "/home/vagrant/download-latest-JHU.sh"
    vm2.vm.provision "file", source: "mongoimport-everything.sh", destination: "/home/vagrant/mongoimport-everything.sh"
    vm2.vm.provision "file", source: "query_covid19.py", destination: "/home/vagrant/query_covid19.py"
    vm2.vm.provision "shell", path: "requirements_vm2.sh"

    vm2.vm.provider "virtualbox" do |vb|
      # Customize the amount of memory on the VM:
      vb.memory = 2048
      vb.cpus = 2
      vb.name ="mongo"
    end
  end


end
