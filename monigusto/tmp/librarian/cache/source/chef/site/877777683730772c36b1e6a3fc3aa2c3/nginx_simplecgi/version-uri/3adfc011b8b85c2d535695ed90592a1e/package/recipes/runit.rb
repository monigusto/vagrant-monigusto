
include_recipe "runit"

wrap_types = [
  node[:nginx_simplecgi][:php] ? :php : nil,
  node[:nginx_simplecgi][:cgi] ? :cgi : nil
].compact

wrap_types.each do |kind|
  runit_service "#{kind}wrap_dispatcher"

  service "#{kind}wrap_dispatcher" do
    supports :status => true, :restart => true
  end
end
