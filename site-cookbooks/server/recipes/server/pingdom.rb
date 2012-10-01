
include_recipe 'openssl'
include_recipe 'pingdom'

pingdom_check 'sos' do
  host 'www.sos.be'
  type 'http'
  api_key node[:pingdom][:api_key]
  username node[:pingdom][:username]
  password node[:pingdom][:password]
  check_params :sendnotificationwhendown => 2,
    :shouldcontain => "Everything is OK!",
    :url => "/",
    :sendtoemail => "true",
    :sendtoiphone => "false"
end
