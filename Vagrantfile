# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "fgrehm/centos-6-64-lxc"

  if Vagrant.has_plugin?('vagrant_cachier')
    config.cache.scope = :box
  end

  config.vm.define 'app01'
  config.vm.synced_folder 'data', '/vagrant_data'

  if Vagrant.has_plugin?('vagrant-hosts')
    config.vm.provision :hosts
  end

  config.vm.provision 'ansible' do |ansible|
    ansible.playbook = 'provisioning/playbook.yml'
    ansible.sudo = true
    ansible.groups = {
      'webservers'  => ['app01'],
      'databases'   => ['app01'],
      'monitoring'  => ['app01']
    }
  end
end
