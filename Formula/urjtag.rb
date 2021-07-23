$version = "2021.03"
$hash = "b0a2eaa245513af096dc4d770109832335c694c6c12aa5e92fefae8685416f1c"

class Urjtag < Formula
  homepage "https://github.com/novi"
  url "https://jaist.dl.sourceforge.net/project/urjtag/urjtag/#{$version}/urjtag-#{$version}.tar.xz"
  sha256 $hash
  version $version

  depends_on "pkg-config"
  depends_on "libusb"
  depends_on "libftdi"
  depends_on "readline"
  
  patch :p0, :DATA

  def install
    system "./configure", "--with-libftdi",
                          "--with-libusb",
                          "--with-ftd2xx",
                          "--with-inpout32",
                          "--enable-python=no",
                          "--prefix=#{prefix}"
    
    system "make"
    system "make", "install"
    #system "aaa"
  end
end
__END__
+++ data/altera/ep4ce22/ep4ce22	2014-07-30 21:48:09.652857260 +1000
@@ -0,0 +1,12 @@
+instruction length 10
+register DIR 32
+register USERCODE 32
+register BSR 732
+register BYPASS 1
+instruction HIGHZ 0000001011 BYPASS
+instruction CLAMP 0000001010 BYPASS
+instruction USERCODE 0000000111 USERCODE
+instruction IDCODE 0000000110 DIR
+instruction SAMPLE/PRELOAD 0000000101 BSR
+instruction EXTEST 0000001111 BSR
+instruction BYPASS 1111111111 BYPASS
+++ data/altera/ep4ce22/STEPPINGS	2014-07-30 21:48:09.644857260 +1000
@@ -0,0 +1,23 @@
+#
+# $Id: STEPPINGS 897 2007-12-29 13:02:32Z arniml $
+#
+# This program is free software; you can redistribute it and/or
+# modify it under the terms of the GNU General Public License
+# as published by the Free Software Foundation; either version 2
+# of the License, or (at your option) any later version.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program; if not, write to the Free Software
+# Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA
+# 02111-1307, USA.
+#
+# Written by H Hartley Sweeten <hsweeten@visionengravers.com>
+#
+
+# bits 31-28 of the Device Identification Register
+0000	ep4ce22		0
+++ data/altera/ep4ce15/ep4ce15	2014-07-30 21:48:09.652857260 +1000
@@ -0,0 +1,12 @@
+instruction length 10
+register DIR 32
+register USERCODE 32
+register BSR 732
+register BYPASS 1
+instruction HIGHZ 0000001011 BYPASS
+instruction CLAMP 0000001010 BYPASS
+instruction USERCODE 0000000111 USERCODE
+instruction IDCODE 0000000110 DIR
+instruction SAMPLE/PRELOAD 0000000101 BSR
+instruction EXTEST 0000001111 BSR
+instruction BYPASS 1111111111 BYPASS
+++ data/altera/ep4ce15/STEPPINGS	2014-07-30 21:48:09.644857260 +1000
@@ -0,0 +1,2 @@
+# bits 31-28 of the Device Identification Register
+0000	ep4ce15		0
--- data/altera/PARTS	2014-07-28 22:19:56.968449502 +1000
+++ data/altera/PARTS	2014-07-30 21:48:08.464857263 +1000
@@ -26,3 +26,5 @@
 0111000100101000	epm7128aetc100		EPM7128AETC100
 0111000001100100	epm3064a		EPM3064A
 0010000010110010	ep2c8			EP2C8
+0010000011110011	ep4ce22			EP4CE22
+0010000011110010	ep4ce15			EP4CE15
--- data/Makefile.am	2017-03-09 04:56:57.000000000 +0900
+++ data/Makefile.am	2021-07-23 22:37:25.000000000 +0900
@@ -48,6 +48,10 @@
 	altera/epm3064a/l44 \
 	altera/epm3064a/t100 \
 	altera/epm3064a/t44 \
+	altera/ep4ce22/STEPPINGS \
+	altera/ep4ce22/ep4ce22 \
+	altera/ep4ce15/STEPPINGS \
+	altera/ep4ce15/ep4ce15 \
 	atheros/ar2312/ar2312 \
 	atmel/PARTS \
 	atmel/at32ap7000/STEPPINGS \
--- data/Makefile.in	2021-03-22 04:59:22.000000000 +0900
+++ data/Makefile.in	2021-07-23 22:43:22.000000000 +0900
@@ -391,6 +391,10 @@
 	altera/epm3064a/l44 \
 	altera/epm3064a/t100 \
 	altera/epm3064a/t44 \
+	altera/ep4ce22/STEPPINGS \
+	altera/ep4ce22/ep4ce22 \
+	altera/ep4ce15/STEPPINGS \
+	altera/ep4ce15/ep4ce15 \
 	atheros/ar2312/ar2312 \
 	atmel/PARTS \
 	atmel/at32ap7000/STEPPINGS \