require 'rubygems'
require 'json'

class VagrantHelper
  PROJECT_ROOT = File.expand_path(File.join(File.dirname(__FILE__), '..', '..'))

  def self.shared_config(config, name, ip_addr)
    config.vm.provisioner = :chef_solo
    config.chef.roles_path = 'roles'
    config.vm.box = "lucid32"
    config.vm.network(ip_addr)
    config.vm.share_folder("v-root", "/vagrant", ".", :nfs => true)
    config.chef.cookbooks_path = [
      File.join(PROJECT_ROOT, "chef/#{name}"),
      File.join(PROJECT_ROOT, "chef/common"),
      File.join(PROJECT_ROOT, "chef/opscode")
    ]
    config.chef.add_role name
    config.chef.run_list.clear
  
    # first read common settings then apply vagrant-specific settings
    common_json = File.read(File.join(PROJECT_ROOT, "config/#{name}/common.json")).strip
    vagrant_json = File.read(File.join(PROJECT_ROOT, "config/#{name}/vagrant.json")).strip
    config.chef.json.merge!(JSON.parse(common_json)) unless common_json.empty?
    config.chef.json.merge!(JSON.parse(vagrant_json)) unless vagrant_json.empty?

    config.chef.run_list = ["recipe[common]"]
  end
end