
Vagrant.configure(2) do |config|



  # config.vm.define "ubuntu" do |machine|
  #   machine.vm.box = "cloudify-installer-build-ubuntu"
  #   machine.vm.box_url= "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"
  #   machine.vm.network :private_network, ip: "10.10.1.10"
  # end

  # config.vm.define "centos" do |machine|
  config.vm.box = "composer-huawei"
  config.vm.box_url= "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"
  config.vm.network :private_network, ip: "10.10.1.10"
  # end

  config.vm.synced_folder "./synced_folder", "/vagrant", type: "rsync"

  config.vm.provider "virtualbox" do |v|
    v.memory = 4096
    v.cpus = 4
  end



  config.vm.provision "shell" do |s|
    s.path = "./provision.sh"
    s.privileged = false
  end
end
