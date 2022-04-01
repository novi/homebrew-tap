$version = "2.2.0"
$hash = "a022fb3d5e72c0cd932c0abf770724133741bd6d80314a876dd0bb1227af71a2"

class Cmysqlmariadb < Formula
  homepage "https://github.com/novi"
  url "https://github.com/novi/cmysql-mariadb/archive/#{$version}.tar.gz"
  sha256 $hash
  version $version

  depends_on "pkg-config"
  depends_on "mariadb"

  def install
    system "mkdir pkgconfig"
    system "mv macos-#{`uname -m | tr -d '\n'`}.pc pkgconfig/cmysql.pc"
    lib.install "pkgconfig"
  end
end
