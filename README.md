# Description:

> "monigusto" - "hearty or keen enjoyment while monitoring"

The `monigusto` project aims to provide the equivalent of `vagrant up` but for monitoring and logging:

A single server box that contains the most common/current tools for monitoring like graphite, statsd, collectd, nagios, logstash, jmxtrans, tasseo and gdash . Then it becomes easy for a developer to get used to the management and monitoring and without the hassle of setting it up from scratch or finding out how to make it work together

# Usage:

## Setup a sample project

    git clone https://github.com/monigusto/vagrant-monigusto.git monigusto
    cd monigusto

## Install necessary gems

    gem install bundler
    bundle install

## Install necessary cookbooks

    bundle exec rake monigusto:install

This will install the cookbooks required for monigusto in monigusto/cookbooks.
You can use your own cookbooks in `site-cookbooks` or `cookbooks`

## Download the basebox

    bundle exec vagrant box add ubuntu-12.04 https://opscode-vm.s3.amazonaws.com/vagrant/boxes/opscode-ubuntu-12.04.box

## Spinup a client and server
    bundle exec vagrant up server
    bundle exec vagrant up client

For Sensu client and server use

    bundle exec vagrant up server_sensu
    bundle exec vagrant up client_sensu


## Customize the configuration

Files that might need customization:

- Vagrantfile
- nodes/\*\.json
- roles/\*\.json

### Network configuration
This currently assumes the following:

- client : 192.168.33.10
- server : 192.168.33.11

### Network ports

#### Mapped by Vagrant

- nagios: <http://localhost:8080>
- graphite: <http://localhost:8081>
- collectd: <http://localhost:8082>
- kibana: <http://localhost:8083>
- tasseo: <http://localhost:8084>
- tasseo: <http://localhost:8085> (nginx)
- statsd: <http://localhost:8086>
- jmx: <http://localhost:8087>
- elasticsearch: <http://localhost:8088>

For Sensu:
- rabbitmq mgmt console: <http://localhost:8089>
- sensu-dashboard: <http://localhost:8090>

#### Accessible from your client

- graphite: tcp/2003
- statsd: udp/8125
- logstash: tcp/5959
- elasticsearch: tcp/9200

For Sensu
- rabbitmq: tcp/5672

## Update monigusto

    bundle exec rake monigusto:update

## Customize a basebox
### Use the prebuild image

<https://opscode-vm.s3.amazonaws.com/vagrant/boxes/opscode-ubuntu-12.04.box>

### Build it with veewee/bentoo

    bundle exec vagrant basebox build ubuntu-12.04
    bundle exec vagrant basebox export ubuntu-12.04
    bundle exec vagrant add ubuntu-12.04 ubunty-12.04.box

# Technology used

## Collectd
- Collectd :
  - Homepage: <http://collectd.org/>
  - Cookbook:
    - (origin) <https://github.com/coderanger/chef-collectd>
    - (ours) <https://github.com/monigusto/chef-collectd>

- Collectd-Carbon: (Graphite writer - Python plugin)
  - Homepage: <http://github.com/indygreg/collectd-carbon>
  - Cookbook:
    - (ours) <https://github.com/monigusto/chef-collectd-carbon>

- Collectd-Elasticsearch: (Python plugin)
  - Homepage: <http://github.com/phobos182/collectd-elasticsearch>
  - Cookbook:
    - (ours) <https://github.com/monigusto/chef-collectd-elasticsearch>

## Graphite

- Graphite:
  - Homepage: <http://graphite.wikidot.com/>
  - Cookbook:
    - (origin) <https://github.com/heavywater/chef-graphite>
    - (ours) <https://github.com/monigusto/chef-graphite>

## Nagios

- Nagios
  - Homepage: <http://nagios.org>
  - Cookbook:
    - (origin) <https://github.com/opscode-cookbooks/nagios>
    - (ours) <https://github.com/monigusto/chef-nagios>

- Nagios-Check-Graphite
  - Homepage:
    - (origin) <https://github.com/etsy/nagios_tools>
    - (ours) <https://github.com/monigusto/nagios_tools>
  - Cookbook:
    - (ours) <https://github.com/monigusto/chef-nagios-check-graphite>

## JMX trans

- JmxTrans:
  - Homepage: <https://github.com/lookfirst/jmxtrans>
  - Cookbook:
    - (origin) <https://github.com/bryanwb/chef-jmxtrans>
    - (ours) <https://github.com/monigusto/chef-jmxtrans>

## Statsd

- Statsd:
  - Homepage: <https://github.com/etsy/statsd>
  - Cookbook:
    - (origin) <https://github.com/jellybob/kitchen>
    - (ours) <https://github.com/monigusto/chef-statsd>

## Logstash

- Logstash/Kibana
  - Homepage: <http://logstash.net>
  - Cookbook:
    - (origin) <https://github.com/lusis/chef-logstash>
    - (ours) <https://github.com/monigusto/chef-logstash>

## Tasseo (graphite dashboard)

- Tasseo:
  - Homepage: <https://github.com/obfuscurity/tasseo>
  - Cookbook:
    - (origin) <https://github.com/danryan/chef-tasseo>
    - (ours) <https://github.com/monigusto/chef-tasseo>

## Chef

- Graphite-Handler (Chef run metrics to Graphite)
  - Homepage: <https://github.com/imeyer/chef-handler-graphite>
  - Cookbook:
    - (origin) <https://github.com/realityforge/chef-graphite_handler>
    - (ours) <https://github.com/monigusto/chef-graphite_handler>

- Logstash-Handler (Chef run logs to Logstash)
  - Homepage: <https://github.com/lusis/logstash_handler>
  - Cookbook:
    - (origin) <https://github.com/lusis/logstash_handler>
    - (ours) <https://github.com/monigusto/logstash_handler>

## Sensu

- Rabbitmq:
  - Homepage: <http://www.rabbitmq.com/>
  - Cookbook:
    - (origin) <https://github.com/opscode-cookbooks/rabbitmq>
    - (ours) <https://github.com/manul/rabbitmq>

- Redis:
  - Homepage: <http://http://redis.io/>
  - Cookbook:
    - (origin) <https://github.com/gchef/redis-cookbook.git>

- Sensu:
  - Homepage: <https://github.com/sensu>
  - Cookbook: 
    - (origin) <https://github.com/sensu/sensu-chef>

- Sensu community plugins:
  - Homepage: <https://github.com/sensu/sensu-community-plugins>
  - Cookbook:
    - (origin) <https://github.com/manul/chef-sensu-community-plugins>