# Maintainer: mesaprotector < arcanapluvia at gmail dot com >
pkgname=kittylauncher
pkgver=
pkgrel=
pkgdesc='Use terminal emulator as basic application launcher'
arch=('any')
url='https://github.com/mesaprotector/kittylauncher'
license=('Apache-2.0')
depends=(
	'kitty'
)
optdepends=(
	'xdotool: use without background service'
	'entr: needed for background service'
	'ttyecho-git: needed for background service'
)
source=($url/archive/v$pkgver/$pkgname-v$pkgver.tar.gz)
sha256sums=()

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -Dm0755 kitty-launch "${pkgdir}/usr/bin/kitty-launch"
	install -Dm0755 kittylauncher.sh "${pkgdir}/usr/lib/kittylauncher/kittylauncher.sh"
	install -Dm0755 prefill.sh "${pkgdir}/usr/lib/kittylauncher/prefill.sh"
	install -Dm0644 kittylauncher.service "${pkgdir}/usr/lib/systemd/system/kittylauncher.service"
	install -Dm0644 kittylauncherrc "${pkgdir}/usr/share/${pkgname}/kittylauncherrc"
	install -Dm0644 _kitty-launch "${pkgdir}/usr/share/${pkgname}/_kitty-launch"
	install -Dm0644 LICENSE "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
	install -Dm0644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
