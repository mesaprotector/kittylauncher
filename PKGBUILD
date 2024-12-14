# Maintainer: mesaprotector < arcanapluvia at gmail dot com >
pkgname=kittylauncher
pkgver=0.0.1
pkgrel=1
pkgdesc='Use terminal emulator as basic application launcher'
arch=('any')
url='https://github.com/mesaprotector/kittylauncher'
license=('Apache-2.0')
depends=(
	'xdotool'
	'kitty'
)
source=($url/archive/v$pkgver/$pkgname-v$pkgver.tar.gz)
sha256sums=()

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -Dm0755 kitty-launch "${pkgdir}/usr/bin/kitty-launch"
	install -Dm0755 kittylauncher.sh "${pkgdir}/usr/lib/kittylauncher.sh"
	install -Dm0644 kittylauncherrc "${pkgdir}/usr/share/${pkgname}/kittylauncherrc"
	install -Dm0644 _kitty-launch "${pkgdir}/usr/share/${pkgname}/_kitty-launch"
	install -Dm0644 LICENSE "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
	install -Dm0644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
