$ProjectName = 'dev'

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "ubuntu/trusty64"
  config.vm.hostname = "#{$ProjectName}"
  config.vm.network :private_network, ip: "10.0.0.10"
  config.vm.network :forwarded_port, guest: 3000, host: 3000
  config.vm.provider "virtualbox" do |v|
    v.memory = 512
    v.cpus = 2
	v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
	v.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/vagrant", "1"]
  end

  #vagrant plugin install vagrant-proxyconf
  #config.proxy.http     = "http://yourproxy:8080"
  #config.proxy.https    = "http://yourproxy:8080"
  #config.proxy.no_proxy = "localhost,127.0.0.1"
  
  config.vm.provision :shell, path: "bootstrap.sh"

end
