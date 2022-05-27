$version = "2.0.6"
$hash = "09754aa74ba110ff3e062df2dadd58cf9c1f1cf25fa41d47df11a58dbb5bfb7c"

class Cmysql < Formula
  homepage "https://github.com/novi"
  url "https://github.com/novi/cmysql/archive/#{$version}.tar.gz"
  sha256 $hash
  version $version

  depends_on "pkg-config"
  depends_on "mysql"

  def install
    system "mkdir pkgconfig"
    system "mv macos-#{`uname -m | tr -d '\n'`}.pc pkgconfig/cmysql.pc"
    lib.install "pkgconfig"
  end
end