Vagrant.configure("2") do |config|
  config.vm.define "docker_vm"
  config.vm.box = "ubuntu/focal64"
  config.vm.box_version = "20221018.0.0"
  config.vm.network "forwarded_port", guest: 80, host: 10000
  config.vm.network "forwarded_port", guest: 443, host: 10001
  config.vm.network "forwarded_port", guest: 3306, host: 13306
  config.vm.network "forwarded_port", guest: 5432, host: 15432
  config.vm.provider "virtualbox" do |v|
    v.memory = 4096
    v.cpus = 4
  end
  config.vm.synced_folder "./vagrant", "/vagrant"
  config.vm.provision "file", source: "./scripts", destination: "$HOME/scripts"
  config.vm.provision "shell", path: "./script.sh"
end