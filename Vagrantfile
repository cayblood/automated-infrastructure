def shared_config(config, name, ip_addr)
  config.vm.provisioner = :chef_solo
  config.chef.roles_path = 'roles'
  config.vm.box = "lucid32"
  config.vm.network(ip_addr)
  config.vm.share_folder("v-root", "/vagrant", ".", :nfs => true)
  config.chef.cookbooks_path = "cookbooks/#{name}"
  config.chef.add_role name
  config.chef.run_list.clear
end

Vagrant::Config.run do |config|
  config.vm.define :web do |web_config|
    shared_config(web_config, 'web', "192.168.10.10")
  end
  
  config.vm.define :vpn do |vpn_config|
    shared_config(vpn_config, 'vpn', "192.168.10.20")
  end
end