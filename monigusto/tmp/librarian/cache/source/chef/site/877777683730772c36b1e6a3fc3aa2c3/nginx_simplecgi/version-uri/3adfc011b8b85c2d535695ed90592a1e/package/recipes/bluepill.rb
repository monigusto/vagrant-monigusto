
include_recipe "bluepill"

wrap_types = [
  node[:nginx_simplecgi][:php] ? :php : nil,
  node[:nginx_simplecgi][:cgi] ? :cgi : nil
].compact

wrap_types.each do |kind|
  template File.join(node[:bluepill][:conf_dir], "#{kind}dispatcher.pill") do
    source 'wrap.pill.erb'
    mode 0644
    variables(
      :pid_file => File.join(
        node[:nginx_simplecgi][:dispatcher_directory],
        "#{kind}wrap_dispatcher.pid"
      ),
      :pill_name => "#{kind}wrap_dispatcher",
      :working_dir => node[:nginx_simplecgi][:dispatcher_directory],
      :exec => "/usr/local/bin/#{kind}wrap_dispatcher"
    )
  end

  bluepill_service "#{kind}wrap_dispatcher" do
    action [:enable, :load]
  end
end
