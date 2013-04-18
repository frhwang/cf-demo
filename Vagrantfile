# -*- mode: ruby -*-
# vi: set ft=ruby :

$script = <<SCRIPT
if [ ! -f '/etc/vagrant_provisioned_at' ]; then
  date > /etc/vagrant_provisioned_at
  mv /etc/apt/sources.list /etc/apt/sources.list.org
  sed s/us.archive.ubuntu.com/ftp.daum.net/g /etc/apt/sources.list.org > /etc/apt/sources.list
  apt-get update
  apt-get install curl -y
  echo "export LC_ALL='en_US.UTF-8'" >> /home/vagrant/.bashrc
  echo "[[ ! -f ~/.cloudfoundry_deployment_local ]] && bash < <(curl -s -k -B https://raw.github.com/cloudfoundry/vcap/master/dev_setup/bin/vcap_dev_setup)" >> /home/vagrant/.bashrc
  echo "alias cf='/home/vagrant/cloudfoundry/vcap/dev_setup/bin/vcap_dev'" >> /home/vagrant/.bashrc
fi
SCRIPT

Vagrant::Config.run("2") do |config|
  config.vm.box = "lucid64"
  config.vm.box_url = "http://files.vagrantup.com/lucid64.box"
  config.vm.hostname = "micro-cloud"
  config.vm.network :private_network, ip: "192.168.56.100"
  config.vm.provision :shell, :inline => $script
  config.vm.provider "virtualbox" do |v|
    v.customize ["modifyvm", :id, "--cpus", "2"]
    v.customize ["modifyvm", :id, "--memory", "2048"]
  end
end
