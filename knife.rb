root = File.expand_path(File.dirname(__FILE__))#File.absolute_path(File.dirname(__FILE__))
 
file_cache_path root
cookbook_path [root + '/site-cookbooks', root + '/cookbooks']
puts "Setting site -cookbook_path to #{root + '/site-cookbooks'}"
