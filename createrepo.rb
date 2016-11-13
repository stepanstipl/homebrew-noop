require 'formula'

# Main class describing formula
class Createrepo < Formula
  homepage 'http://createrepo.baseurl.org//'
  url 'http://createrepo.baseurl.org/download/createrepo-0.4.11.tar.gz'
  sha256 'a73ae11a0dcde8bde36d900bc3f7f8f1083ba752c70a5c61b72d1e1e7608f21b'

  depends_on 'stepanstipl/noop/yum-metadata-parser'
  depends_on 'stepanstipl/noop/rpm4'
  depends_on 'coreutils'
  depends_on 'libxml2' => 'with-python'

  def install
    inreplace(
      ['bin/createrepo', 'bin/modifyrepo'], '/usr/share/createrepo', "#{HOMEBREW_PREFIX}/share/createrepo")

    inreplace(
      ['dmd.py', 'dumpMetadata.py', 'genpkgmetadata.py', 'readMetadata.py'], '/usr/bin/python', '/usr/bin/env python')

    system(
      'make', "prefix=#{prefix}", 'INSTALL=ginstall -p --verbose', 'install')
  end

  def caveats
    homebrew_site_packages = Language::Python.homebrew_site_packages
    keg_site_packages = "#{Formula['libxml2'].opt_prefix}/lib/python2.7/site-packages"
    msg = <<-EOS.undent
      Please make sure python can find libxml2 module.
      There's couple of ways to achieve that, libxml2 module should give you
      relevant hint when installing. One of the ways that might work for you:
        echo #{keg_site_packages} >> #{homebrew_site_packages}/libxml2.pth
    EOS
    msg
  end
end
