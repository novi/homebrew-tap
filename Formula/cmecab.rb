$version = "0.3.0"
$hash = "5668af1f939988c4d71ae3d11b263c3a4f4e5d232b0ddf77e2f480fc946d78bc"

class Cmecab < Formula
  homepage "https://github.com/novi"
  url "https://github.com/novi/mecab-swift/archive/#{$version}.tar.gz"
  sha256 $hash
  version $version

  depends_on "pkg-config"
  depends_on "mecab"
  depends_on "mecab-ipadic"

  def install
    system "mkdir pkgconfig"
    system "mv Sources/cmecab/macos.pc pkgconfig/cmecab.pc"
    lib.install "pkgconfig"
  end
end