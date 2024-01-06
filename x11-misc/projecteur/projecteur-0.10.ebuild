# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MY_PN="${PN/p/P}"

inherit cmake udev xdg-utils

DESCRIPTION="Linux Desktop Application for the Logitech Spotlight device"
HOMEPAGE="https://github.com/jahnf/Projecteur"
SRC_URI="https://github.com/jahnf/${MY_PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/${MY_PN}-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"

RDEPEND="
	dev-qt/qtcore:5
	dev-qt/qtdeclarative:5
	|| (
		dev-qt/qtgui:5[X(-)]
		dev-qt/qtgui:5[xcb(-)]
	)
	dev-qt/qtnetwork:5
	dev-qt/qtwidgets:5
	dev-qt/qtx11extras:5
	virtual/udev
	x11-libs/libX11
"
DEPEND="${RDEPEND}"

BDEPEND="virtual/pkgconfig"

src_prepare() {
	cmake_src_prepare

	# Don't treat all warnings as errors
	sed -e '/add_compile_options/d' -i CMakeLists.txt || die
}

src_configure() {
	local mycmakeargs=(
		-DCOMPRESS_MAN_PAGE="OFF"
		-DPROJECTEUR_QT_VERSION=5
	)

	cmake_src_configure
}

pkg_postinst() {
	udev_reload
	xdg_icon_cache_update
}

pkg_postrm() {
	udev_reload
	xdg_icon_cache_update
}
