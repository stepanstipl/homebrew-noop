# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  config.vm.box = 'osx-yosemite'

  config.vm.provision 'file', source: 'rpm4.rb', destination: 'rpm4.rb'
  config.vm.provision 'file', source: 'yum-metadata-parser.rb', destination: 'yum-metadata-parser.rb'
  config.vm.provision 'file', source: 'createrepo.rb', destination: 'createrepo.rb'
  config.vm.provision 'file', source: 'rpmlint.rb', destination: 'rpmlint.rb'

  config.vm.provision 'shell', privileged: false, inline: <<-SHELL
    brew install rpm4.rb
    brew install yum-metadata-parser.rb
    brew install createrepo.rb
    brew install rpmlint.rb
    mkdir -p /Users/$(whoami)/Library/Python/2.7/lib/python/site-packages
    echo 'import site; site.addsitedir("/usr/local/lib/python2.7/site-packages")' \
        >> /Users/$(whoami)/Library/Python/2.7/lib/python/site-packages/homebrew.pth
    echo /usr/local/opt/libxml2/lib/python2.7/site-packages >> /usr/local/lib/python2.7/site-packages/libxml2.pth

  SHELL
end
