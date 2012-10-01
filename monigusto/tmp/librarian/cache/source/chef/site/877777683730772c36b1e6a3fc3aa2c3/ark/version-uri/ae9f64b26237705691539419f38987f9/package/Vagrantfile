Vagrant::Config.run do |config|

  config.vm.define :oneiric do |dist_config|
    dist_config.vm.box     = "ubuntu-1110-server-amd64"
    dist_config.vm.box_url = "http://timhuegdon.com/vagrant-boxes/ubuntu-11.10.box"
    dist_config.vm.network :bridged
    
    dist_config.vm.provision :chef_solo do |chef|

      chef.cookbooks_path = ["/home/hitman/chef-repo-opscode/site-cookbooks/",
                             "/home/hitman/chef-repo-opscode/cookbooks/"
                            ]

      chef.log_level      = :debug

      chef.add_recipe     "chef_handler"
      chef.add_recipe     "minitest-handler"
      chef.add_recipe     "ark"
      chef.add_recipe     "ark::test"

    end
  end

  config.vm.define :centos6 do |dist_config|
    dist_config.vm.box     = "centos6"
    dist_config.vm.box_url = "http://dl.dropbox.com/u/9227672/CentOS-6.0-x86_64-netboot-4.1.6.box"
    dist_config.vm.network :bridged
    
    dist_config.vm.provision :chef_solo do |chef|

      chef.cookbooks_path = ["/home/hitman/chef-repo-opscode/site-cookbooks/",
                             "/home/hitman/chef-repo-opscode/cookbooks/"
                            ]

      chef.log_level      = :debug

      chef.add_recipe     "chef_handler"
      chef.add_recipe     "minitest-handler"
      chef.add_recipe     "ark"
      chef.add_recipe     "ark::test"

    end
  end
end

