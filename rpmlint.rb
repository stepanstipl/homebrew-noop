require 'formula'

# Main class describing formula
class Rpmlint < Formula
  homepage 'http://sourceforge.net/projects/rpmlint/'
  url 'http://sourceforge.net/projects/rpmlint/files/rpmlint-1.6.tar.xz/download'
  sha256 'a0dae71a3fed413ee5c47bd04f393cd6598c68c0dcf1504fa020d62814ff674b'

  depends_on 'stepanstipl/noop/rpm4'
  depends_on "python@2"
  depends_on 'libmagic' => [:recommended, 'with-python']
  depends_on 'enchant' => [:recommended, 'with-python']
  depends_on 'xz'

  def install
    inreplace ['rpmlint'], '/usr/share/rpmlint/config', "#{HOMEBREW_PREFIX}/etc/rpmlint/config"
    inreplace %w(rpmlint rpmdiff), '/usr/share/rpmlint', "#{HOMEBREW_PREFIX}/lib/rpmlint"
    inreplace ['rpmlint', 'rpmdiff', 'tools/generate-isocodes.py'], '/usr/bin/python', '/usr/bin/env python'

    args = ["BINDIR=#{bin}", "LIBDIR=#{lib}/rpmlint", "ETCDIR=#{etc}", "MANDIR=#{man}"]

    ENV.deparallelize

    system 'make', 'COMPILE_PYC=1'

    system 'make', 'install', "prefix=#{prefix}", *args
  end
end
