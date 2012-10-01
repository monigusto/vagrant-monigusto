root = File.expand_path(File.dirname(__FILE__))#File.absolute_path(File.dirname(__FILE__))
 
file_cache_path root
cookbook_path [root + '/cookbooks',root + 'monigusto/cookbooks', root + '/site-cookbooks']
puts "Setting cookbook_path to #{root + '/cookbooks'}"
