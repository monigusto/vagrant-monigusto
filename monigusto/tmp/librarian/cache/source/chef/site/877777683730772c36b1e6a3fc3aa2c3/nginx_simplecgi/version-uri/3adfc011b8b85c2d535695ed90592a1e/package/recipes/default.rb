
# By default, nothing is setup. This allows cookbooks dependent on
# simplecgi to define how they would like the setup to occur without
# relying on attributes being set directly within nginx_simplecgi

if(node[:nginx_simplecgi][:cgi] || node[:nginx_simplecgi][:php])
  include_recipe 'nginx_simplecgi::setup'
end
