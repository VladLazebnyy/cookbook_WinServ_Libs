# -*- mode: ruby -*-
# vi: set ft=ruby :
hostname = 'libs.local'
Vagrant.configure(2) do |config|
  config.vm.box = "opentable/win-2012r2-standard-amd64-nocm"
  config.vm.hostname = hostname
  config.vm.network :private_network, type: "dhcp"
  config.vm.guest = :windows
  config.vm.network :forwarded_port, guest: 3389, host: 3389, id: "rdp", auto_correct: true
  config.vm.network :forwarded_port, guest: 22, host: 2222, id: "ssh", auto_correct: true

  config.winrm.username = "vagrant"
  config.winrm.password = "vagrant"


  config.omnibus.chef_version = :latest
  config.berkshelf.berksfile_path = "./Berksfile"
  config.berkshelf.enabled = true

  config.vm.provider "virtualbox" do |vb|
     vb.gui = true
     vb.memory = "1024"
   end
 config.vm.provision :chef_solo do |chef|
    chef.json = {
    'cookbook_WinSer_Libs' => {
        'version' => :latest
      }
    }
    chef.add_recipe('cookbook_WinSer_Libs')
  end


end
