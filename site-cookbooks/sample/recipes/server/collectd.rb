include_recipe "collectd"
collectd_plugin "memory"
collectd_plugin "cpu"
collectd_plugin "disk"
collectd_plugin "interface"
collectd_plugin "users"
collectd_plugin "uptime"
collectd_plugin "swap"
collectd_plugin "processes"
collectd_plugin "load"

collectd_plugin "snmp" do
  cookbook "monigusto_server"
  template "snmp.conf"
end

package "curl"
collectd_plugin "apache" do
end

