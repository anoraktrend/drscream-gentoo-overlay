# Copyright 1999-2003 Kevin Korb
# $Header:

# This is the ancient version of fvwm that I like to use.
# It is NOT compatible with fvwm-2

inherit flag-o-matic eutils

IUSE=""

DESCRIPTION="An ancient versoion of the fvwm window manager"
SRC_URI="http://cdn.netbsd.org/pub/pkgsrc/distfiles/LOCAL_PORTS/${P}.tar.gz"
HOMEPAGE="http://www.fvwm.org/"

#FPV=${FILESDIR}/${PV}

SLOT="1"
LICENSE="GPL-2"
KEYWORDS="x86 amd64"

#DEPEND="virtual/x11"
DEPEND="x11-libs/libX11
	x11-misc/imake
	x11-libs/libXpm
	x11-misc/xbitmaps"

src_unpack() {
	unpack ${P}.tar.gz
	cd ${S}

}

src_configure() {
	append-cflags -fcommon
	default
}

src_compile() {
	xmkmf -a
	emake || die
	mv -v fvwm/fvwm.man fvwm/fvwm.1

}

src_install () {
	into /usr
	dobin fvwm/fvwm
	doman fvwm/fvwm.1
	dodoc documentation/*
	dodir /usr/lib/X11
	dodir /usr/lib/X11/fvwm
	insinto /usr/lib/X11/fvwm
	exeinto /usr/lib/X11/fvwm
	doins sample.fvwmrc/system.fvwmrc
	doexe modules/GoodStuff/GoodStuff
	doexe modules/FvwmIdent/FvwmIdent
	doexe modules/FvwmDebug/FvwmDebug
	doexe modules/FvwmBacker/FvwmBacker
	doexe modules/FvwmClean/FvwmClean
	doexe modules/FvwmPager/FvwmPager
	doexe modules/FvwmAudio/FvwmAudio
	doexe modules/FvwmScroll/FvwmScroll
	doexe modules/FvwmIconBox/FvwmIconBox
	doexe modules/FvwmSave/FvwmSave
	doexe modules/FvwmSaveDesk/FvwmSaveDesk
	doexe modules/FvwmAuto/FvwmAuto
	doexe modules/FvwmWinList/FvwmWinList
	doexe modules/FvwmBanner/FvwmBanner
	insinto /usr/lib/X11
	exeinto /usr/lib/X11
	doexe xpmroot/xpmroot
	dodir /usr/include
	dodir /usr/include/X11
	dodir /usr/include/X11/pixmaps
	dodir /usr/include/X11/bitmaps
	insinto /usr/include/X11/pixmaps
	doins fvwm_icons/*.xpm
	insinto /usr/include/X11/bitmaps
	doins fvwm_icons/*.xbm
	doins fvwm_icons/*.bitmap
	doins fvwm_icons/*.icon
}
