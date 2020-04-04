# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3 meson

DESCRIPTION="High-level wayland compositor library based on wlroots"
HOMEPAGE="https://git.sr.ht/~bl4ckb0ne/wltrunk"
EGIT_REPO_URI="https://git.sr.ht/~bl4ckb0ne/${PN}"

LICENSE="MIT"
SLOT="0"
IUSE=""

DEPEND="
        >=dev-libs/wayland-1.17.0
        >=dev-libs/wayland-protocols-1.17
        x11-libs/libxkbcommon
        x11-libs/pixman
"
RDEPEND="${DEPEND}"
# wlroot-0.6.0 changed API and wltrunk still not working yet
BDEPEND="
        >=dev-util/meson-0.47.0
        gui-libs/wlroots
"
