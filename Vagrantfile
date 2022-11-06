Vagrant.configure("2") do |config|
  config.vm.define "docker_vm"
  config.vm.box = "ubuntu/focal64"
  config.vm.box_version = "20221018.0.0"
  config.vm.network "forwarded_port", guest: 80, host: 20080
  config.vm.network "forwarded_port", guest: 443, host: 20443
  config.vm.network "forwarded_port", guest: 3306, host: 23306
  config.vm.network "forwarded_port", guest: 5432, host: 25432
  config.vm.network "forwarded_port", guest: 8080, host: 28080
  config.vm.network "forwarded_port", guest: 8443, host: 28443
  config.vm.provider "virtualbox" do |v|
    v.memory = 4096
    v.cpus = 4
  end
  config.vm.synced_folder "./vagrant", "/vagrant"
  config.vm.provision "file", source: "./scripts", destination: "$HOME/scripts"
  config.vm.provision "shell", path: "./script.sh"
end