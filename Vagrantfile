# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "fgrehm/centos-6-64-lxc"

  if Vagrant.has_plugin?('vagrant_cachier')
    config.cache.scope = :box
  end

  config.vm.define 'web' do |web|
    web.vm.synced_folder 'data', '/vagrant_data'

    if Vagrant.has_plugin?('vagrant-hosts')
      web.vm.provision :hosts
    end

    web.vm.provision 'ansible' do |ansible|
      ansible.playbook = 'provisioning/playbook.yml'
      ansible.sudo = true
      ansible.groups = {
        'webservers'  => ['web'],
        'monitoring'  => ['web']
      }
    end
  end

  config.vm.define 'db' do |db|
    db.vm.synced_folder 'data', '/vagrant_data'

    if Vagrant.has_plugin?('vagrant-hosts')
      db.vm.provision :hosts
    end

    db.vm.provision 'ansible' do |ansible|
      ansible.playbook = 'provisioning/playbook.yml'
      ansible.sudo = true
      ansible.groups = {
        'databases'   => ['db'],
        'monitoring'  => ['db']
      }
    end
  end

end
