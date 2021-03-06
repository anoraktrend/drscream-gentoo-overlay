# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id: 129f61dcdb296c77af1e8e1100091e02cce7515e $

EAPI=7

MY_PN="open-watcom-v2"

DESCRIPTION="Open Watcom compiler"
HOMEPAGE="https://github.com/open-watcom/open-watcom-v2"
LICENSE="OWPL-1"
SLOT="0"
RESTRICT="strip network-sandbox"

KEYWORDS="~amd64 ~x86"

DEPEND="
	net-misc/wget
	|| ( games-emulation/dosbox games-emulation/dosbox-x )
"

S="${WORKDIR}/watcom"

src_unpack() {
	einfo "Fetching ${PN} tarball"
	wget "https://github.com/open-watcom/open-watcom-v2/releases/download/Last-CI-build/ow-snapshot.tar.gz" || die

	mkdir "${WORKDIR}/watcom"
	tar zxf "${WORKDIR}/ow-snapshot.tar.gz" -C "${WORKDIR}/watcom" || die

}

src_install() {
	local OWROOT="${WORKDIR}/watcom"

	dodoc "${OWROOT}/areadme.txt" "${OWROOT}/freadme.txt" "${OWROOT}/readme.txt" "${OWROOT}/ide.doc"

	chmod -R 755 ${OWROOT}/{h,lh}

	mkdir "${D}/opt"
	mv "${OWROOT}" "${D}/opt/watcom"

	cd "${D}/opt/watcom/binl"
	ln -s /bin/true ranlib
	ln -s wlib ar

	exeinto /opt/bin
	doexe "${FILESDIR}/owsetenv.sh"
}
