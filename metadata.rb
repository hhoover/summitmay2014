maintainer        'Greg Fitzgerald'
maintainer_email  'greg@gregf.org'
license           'Apache 2'
description       'Installs/Configures minecraft server'
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           '0.5.1'
name              'minecraft'

recipe 'minecraft', 'Installs and configures minecraft server.'

%w(java runit ohai apt yum).each do |dep|
  depends dep
end

%w(debian ubuntu centos).each do |os|
  supports os
end
