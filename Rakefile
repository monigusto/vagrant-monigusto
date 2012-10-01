namespace :monigusto do

  desc "Install monigusto cookbooks"
  task :install do
    puts "Installing monigusto cookbooks in #{File.join(File.dirname(__FILE__),'monigusto')}"
    `cd "#{File.join(File.expand_path(File.dirname(__FILE__)),'monigusto')}" && librarian-chef install`
  end

  desc "Update monigusto cookbooks"
  task :update do
    puts "Updating monigusto cookbooks in #{File.join(File.dirname(__FILE__),'monigusto')}"
    `cd "#{File.join(File.expand_path(File.dirname(__FILE__)),'monigusto')}" && librarian-chef clean && librarian-chef update`
  end

end
