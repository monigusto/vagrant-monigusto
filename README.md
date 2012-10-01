# Description:
The `monigusto` project aims to provide the equivalent of `vagrant up` but for monitoring and logging:

A single server box that contains the most common/current tools for monitoring like graphite, statsd, collectd, nagios, logstash, jmxtrans, tasseo and gdash . Then it becomes easy for a developer to get used to the management and monitoring and without the hassle of setting it up from scratch or finding out how to make it work together

__Work in progress - not fully configurable yet__
# Usage:

## Setup a sample project

    git clone https://github.com/monigusto/monigusto-vagrant.git monigusto
    cd monigusto

## Install necessary gems

    gem install bundler
    bundle install

## Install necessary cookbooks

    rake monigusto:install

## Get a basebox
### Use the prebuild image (TODO)
We will provide a pre-downloadable box file soon, so you can skip this part

### Build it with veewee

    bundle exec vagrant basebox build ubuntu-12.04
    bundle exec vagrant basebox export ubuntu-12.04
    bundle exec vagrant add ubuntu-12.04 ubunty-12.04.box

## Install the necessary cookbooks
    bundle exec librarian-chef install --path monigusto-cookbooks

## Spinup a client and server
    bundle exec vagrant up server
    bundle exec vagrant up client

## Customize the box

Files that might need customization:

- Vagrantfile
- nodes/\**\*json
- roles/\**\*.json

### Network configuration
This currently assumes the following:

- client : 192.168.33.10
- server : 192.168.33.11

### Network ports

- nagios: 8080
- graphite: 8081
- collectd: 8082
- kibana: 8083
- tasseo: 8084
- tasseo: 8085 (nginx)
- statsd: 8086
- jmx: 8087
- elasticsearch: 8088

# Technology used
We use chef to set it up and have have use the following cookbooks:

TODO - write this up
