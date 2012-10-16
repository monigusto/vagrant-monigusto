# -*- mode: ruby -*-
# vi: set ft=ruby :

server_config = {
    :server => {
        :role => "monigusto_server"
    },
    :server_sensu => {
        :role => "monigusto_server_sensu"
    }
}

client_config = {
    :client => {
        :role => "monigusto_client"
    },
    :client_sensu => {
        :role => "monigusto_client_sensu"
    }
}

Vagrant::Config.run do |config|

  server_config.each_pair do |name, options|
    config.vm.define name do |server_config|
      # Every Vagrant virtual environment requires a box to build off of.
      server_config.vm.box = "ubuntu-12.04"

      # Add a little more memory to allow for internal hosts
      server_config.vm.customize ["modifyvm", :id, "--memory", 3072]

      server_config.vm.network :hostonly, "192.168.33.11"
      server_config.vm.host_name = "vagrant-server.vm"

      # server_config.vm.network :bridged

      server_config.vm.forward_port 8080, 8080

      server_config.vm.forward_port 8081, 8081

      server_config.vm.forward_port 8082, 8082

      server_config.vm.forward_port 8083, 8083
      # Nginx Tasseo
      server_config.vm.forward_port 8084, 8084
      # Tasseo
      server_config.vm.forward_port 5000, 8085
      # Statsd telnet interface (see https://github.com/etsy/statsd)
      # telnet localhost 8086
      # use commands 'stats' 'counters' or 'timers'
      server_config.vm.forward_port 8126, 8086
      # JMX
      server_config.vm.forward_port 1105, 8087
      # ES
      server_config.vm.forward_port 9200, 8088

      if name == :server_sensu
        # RabbitMQ
        server_config.vm.forward_port 55672, 8089
        # Sensu-dashboard
        server_config.vm.forward_port 8090, 8090
      end

      # We need to increase timeout due to the forward ports default = 10
      server_config.ssh.timeout = 1000
      server_config.ssh.max_tries = 3000

      # server_config.vm.share_folder "v-data", "/vagrant_data", "../data"

      server_config.vm.provision :chef_solo do |chef|
        chef.cookbooks_path = [ "cookbooks" , "monigusto/cookbooks","site-cookbooks"]
        chef.roles_path = "roles"
        chef.data_bags_path = "data_bags"
        chef.add_role options[:role]
      end
    end
  end
  client_config.each_pair do |name, options|

    config.vm.define name do |client_config|
      # Every Vagrant virtual environment requires a box to build off of.
      client_config.vm.box = "ubuntu-12.04"

      # Add a little more memory to allow for internal hosts
      client_config.vm.customize ["modifyvm", :id, "--memory", 1024]

      client_config.vm.network :hostonly, "192.168.33.10"
      client_config.vm.host_name = "vagrant-client.vm"

      # client_config.vm.network :bridged

      # client_config.vm.forward_port 80, 8080

      # client_config.vm.share_folder "v-data", "/vagrant_data", "../data"

      client_config.vm.provision :chef_solo do |chef|
        chef.cookbooks_path = [ "cookbooks" , "monigusto/cookbooks","site-cookbooks"]
        chef.roles_path = "roles"
#      chef.log_level = :debug
        chef.data_bags_path = "data_bags"
        chef.add_role options[:role]
      end
    end
  end
end
