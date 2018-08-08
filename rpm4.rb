require 'formula'

# Main class describing formula
class Rpm4 < Formula
  homepage 'http://www.rpm.org/'
  url 'http://ftp.rpm.org/releases/rpm-4.14.x/rpm-4.14.1.tar.bz2'
  sha256 '43f40e2ccc3ca65bd3238f8c9f8399d4957be0878c2e83cba2746d2d0d96793b'

  depends_on 'pkg-config' => :build
  depends_on 'nss'
  depends_on 'nspr'
  depends_on 'libmagic'
  depends_on 'popt'
  depends_on 'lua51'
  depends_on 'berkeley-db'
  depends_on 'xz'
  depends_on 'libarchive'
  depends_on "python@2"

  conflicts_with 'rpm', because: 'These are two different forks of the same tool.'

  def install
    # Fix for removed python. stuff... Argh!
    pypref = `python-config --prefix`.chomp
    pybin = "#{pypref}/bin/python"

    # some of nss/nspr formulae might be keg-only:
    ENV.append 'CPPFLAGS', "-I#{Formula['nss'].include}"
    ENV.append 'CPPFLAGS', "-I#{Formula['nspr'].include}"
    ENV.append 'LDFLAGS', `python-config --ldflags`

    # pkg-config support was removed from lua 5.2:
    ENV['LUA_CFLAGS'] = "-I#{HOMEBREW_PREFIX}/include/lua5.1"
    ENV['LUA_LIBS'] = "-L#{HOMEBREW_PREFIX}/lib -llua5.1"

    ENV['__PYTHON'] = pybin

    args = %W(
      --disable-dependency-tracking
      --prefix=#{prefix}
      --sysconfdir=#{HOMEBREW_PREFIX}/etc
      --localstatedir=#{HOMEBREW_PREFIX}/var
      --with-external-db
      --with-lua
      --without-hackingdocs
      --enable-python)
    system './configure', *args
    system 'make'
    system 'make install'

    # the default install makes /usr/bin/rpmquery a symlink to /bin/rpm
    # by using ../.. but that doesn't really work with any other prefix.
    ln_sf 'rpm', "#{bin}/rpmquery"
    ln_sf 'rpm', "#{bin}/rpmverify"
  end
end
