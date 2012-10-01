# Required for the headers rewrite for tasseo
include_recipe "apache2"
apache_module "headers" do
end
