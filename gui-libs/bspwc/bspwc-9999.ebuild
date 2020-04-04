# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3 meson

DESCRIPTION="Wayland compositor based on BSPWM"
HOMEPAGE="https://git.sr.ht/~bl4ckb0ne/bspwc"
EGIT_REPO_URI="https://git.sr.ht/~bl4ckb0ne/${PN}"

LICENSE="MIT"
SLOT="0"
IUSE=""

DEPEND="
        >=dev-libs/wayland-1.17.0
        >=dev-libs/wayland-protocols-1.17
"
RDEPEND="${DEPEND}"
BDEPEND="
        >=dev-util/meson-0.47.0
        gui-libs/wlroots
        gui-libs/wltrunk
"
