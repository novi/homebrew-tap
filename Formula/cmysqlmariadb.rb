$version = "2.1.0"
$hash = "3c8402e3cd8d0690638c41afd35ae1ee4fc9e3cd5b7010a39a917630333c40ae"

class Cmysqlmariadb < Formula
  homepage "https://github.com/novi"
  url "https://github.com/novi/cmysql-mariadb/archive/#{$version}.tar.gz"
  sha256 $hash
  version $version

  depends_on "pkg-config"
  depends_on "mariadb"

  def install
    system "mkdir pkgconfig"
    system "mv macos.pc pkgconfig/cmysql.pc"
    lib.install "pkgconfig"
  end
end
