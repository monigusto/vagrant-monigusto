# Get your gems together
    gem install bundler
    bundle install

# Create basebox
    bundle exec vagrant basebox build 'ubuntu-12.04-amd64'
    bundle exec vagrant basebox export

# Add box to vagrant
    vagrant box add ..
    vagrant up

# Install chef cookbooks
    bundle exec librarian-chef install

# Start the machines
    bundle exec vagrant up server
    bundle exec vagrant up client
