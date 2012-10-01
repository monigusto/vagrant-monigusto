
template '/usr/local/bin/cgiwrap_dispatcher' do
  source 'cgiwrap-dispatcher.erb'
  variables(
    :dispatch_dir => node[:nginx_simplecgi][:dispatcher_directory],
    :dispatch_procs => node[:nginx_simplecgi][:dispatcher_processes]
  )
  mode '0755'
end
