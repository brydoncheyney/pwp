# -*- mode: ruby -*-
# vi: set ft=ruby :

# Creates a map of ansible group names to group members, i.e.
#   {
#     'webservers'  => ['instance'],
#     'monitoring'  => ['instance']
#   }
def create_ansible_groups(groups, member)
  Hash[groups.collect {|group| [group, member]}]
end

# Creates an xlx container with the given options
def create_instance_for(options)

  name   = options[:name]
  config = options[:config]
  roles  = options[:roles]

  config.vm.define name do |instance|
    instance.vm.synced_folder 'data', '/vagrant_data'

    if Vagrant.has_plugin?('vagrant-hosts')
      instance.vm.provision :hosts
    end

    instance.vm.provision 'ansible' do |ansible|
      ansible.playbook = 'provisioning/playbook.yml'
      ansible.sudo = true
      create_ansible_groups(roles, name)
      ansible.groups = create_ansible_groups(roles, name)
    end
  end
end

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "fgrehm/centos-6-64-lxc"

  if Vagrant.has_plugin?('vagrant_cachier')
    config.cache.scope = :box
  end

  create_instance_for({:name => 'web',
                       :config => config,
                       :roles => %w(webservers monitoring)})

  create_instance_for({:name => 'db',
                       :config => config,
                       :roles => %w(databases monitoring)})

end
