# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="A media downloader application"
HOMEPAGE="https://github.com/mhogomchungu/media-downloader"
SRC_URI="https://github.com/mhogomchungu/media-downloader/releases/download/${PV}/media-downloader-${PV}.tar.xz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RESTRICT="strip"

RDEPEND="
	dev-cpp/gtkmm:4.0
	"

S="${WORKDIR}/media-downloader-${PV}"

src_unpack() {
    default_src_unpack
}

src_prepare() {
    cmake_src_prepare
}

src_compile() {
    cmake_src_compile
}

src_install() {
    cmake_src_install
}

pkg_postinst() {
    elog "media-downloader has been installed."
}
