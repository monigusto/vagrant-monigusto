maintainer       "Chris Roberts"
maintainer_email "chrisroberts.code@gmail.com"
license          "Apache 2.0"
description      "Provides SimpleCGI for NGINX"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.1.0"

supports 'ubuntu'

%w{ nginx perl runit bluepill }.each do |dep|
  depends dep
end

suggests 'yum'
