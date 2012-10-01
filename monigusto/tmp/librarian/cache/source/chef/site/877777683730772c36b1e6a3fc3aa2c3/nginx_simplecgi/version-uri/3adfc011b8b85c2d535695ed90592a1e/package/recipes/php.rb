pkgs = value_for_platform(
  %w(redhat centos fedora scientific) => {
    %w(5.0 5.1 5.2 5.3 5.4 5.5 5.6 5.7 5.8) => %w(php53),
    "default" => %w(php)
  },
  %w(debian ubuntu) => {
    "default" => %w(php5-cgi)
  },
  "default" => %w(php5-cgi)
)

pkgs.each do |package_name|
  package package_name
end

template '/usr/local/bin/phpwrap_dispatcher' do
  source 'phpwrap-dispatcher.erb'
  variables(
    :nginx_user => node[:nginx][:user],
    :nginx_group => node[:nginx][:group] || node[:nginx][:user],
    :dispatch_dir => node[:nginx_simplecgi][:dispatcher_directory],
    :dispatch_procs => node[:nginx_simplecgi][:dispatcher_processes],
    :php_cgi_bin => node[:nginx_simplecgi][:php_cgi_bin]
  )
  mode '0755'
end
