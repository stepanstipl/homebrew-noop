# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  config.vm.box = 'osx-yosemite'

  config.vm.provision 'shell', privileged: false, inline: <<-SHELL
    brew tap stepanstipl/noop
    brew install createrepo
    brew install rpmlint
    mkdir -p /Users/$(whoami)/Library/Python/2.7/lib/python/site-packages
    echo 'import site; site.addsitedir("/usr/local/lib/python2.7/site-packages")' \
        >> /Users/$(whoami)/Library/Python/2.7/lib/python/site-packages/homebrew.pth
    echo /usr/local/opt/libxml2/lib/python2.7/site-packages >> /usr/local/lib/python2.7/site-packages/libxml2.pth

  SHELL
end
