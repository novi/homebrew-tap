$version = "2.0.5"
$hash = "4cb9620fbb68571be11ba13afc8911fd434561b9ff661040a128618af19bbbb5"

class Cmysql < Formula
  homepage "https://github.com/novi"
  url "https://github.com/novi/cmysql/archive/#{$version}.tar.gz"
  sha256 $hash
  version $version

  depends_on "pkg-config"
  depends_on "mysql"

  def install
    system "mkdir pkgconfig"
    system "mv macos.pc pkgconfig/cmysql.pc"
    lib.install "pkgconfig"
  end
end