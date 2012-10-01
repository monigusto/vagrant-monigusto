default[:nginx_simplecgi] = Mash.new
# Enable CGI dispatcher
default[:nginx_simplecgi][:cgi] = false
# Enable PHP dispatcher
default[:nginx_simplecgi][:php] = false
# Directory to contain dispatcher socket and pid file
default[:nginx_simplecgi][:dispatcher_directory] = '/var/run/nginx'
# Number of dispatcher process to handle requests
default[:nginx_simplecgi][:dispatcher_processes] = 4
# Location of PHP CGI executable
default[:nginx_simplecgi][:php_cgi_bin] = '/usr/bin/php-cgi'
# Type of init (:upstart, :runit, :bluepill, :monit)
default[:nginx_simplecgi][:init_type] = :upstart
