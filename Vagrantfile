$LOAD_PATH << File.join(File.expand_path(File.dirname(__FILE__)), 'lib')
require 'myconfig'

Vagrant::Config.run do |config|
  config.vm.define :web do |web_config|
    VagrantHelper.shared_config(web_config, 'web', "192.168.10.10")
  end
  
  config.vm.define :vpn do |vpn_config|
    VagrantHelper.shared_config(vpn_config, 'vpn', "192.168.10.20")
  end
end