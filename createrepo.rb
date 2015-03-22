require 'formula'

class Createrepo < Formula
  homepage 'http://createrepo.baseurl.org//'
  url 'http://createrepo.baseurl.org/download/createrepo-0.4.11.tar.gz' 
  sha1 '10316e9ee98e92f961c727cf991589611a2de7cb'

  depends_on 'stepanstipl/noop/yum-metadata-parser'
  depends_on 'stepanstipl/noop/rpm4'
  depends_on 'coreutils'
  depends_on 'libxml2' => "with-python"

  def install
    
    inreplace ['bin/createrepo', 'bin/modifyrepo'], '/usr/share/createrepo', "#{HOMEBREW_PREFIX}/share/createrepo"
    inreplace ['dmd.py','dumpMetadata.py', 'genpkgmetadata.py', 'readMetadata.py'], '/usr/bin/python', '/usr/bin/env python' 

    system 'make', "prefix=#{prefix}", 'INSTALL=ginstall -p --verbose', 'install'
    
  end

  def caveats
    homebrew_site_packages = Language::Python.homebrew_site_packages
    keg_site_packages = "#{Formula["libxml2"].opt_prefix}/lib/python2.7/site-packages"
    msg = <<-EOS.undent
      Please make sure python can find libxml2 module.
      There's couple of ways to achieve that, libxml2 module should give you
      relevant hint when installing. One of the ways that might work for you:
        echo #{keg_site_packages} >> #{homebrew_site_packages}/libxml2.pth
    EOS
    msg
  end

end
