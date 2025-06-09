# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A terminal stock ticker written in Go"
HOMEPAGE="https://github.com/achannarasappa/ticker"
SRC_URI="https://github.com/achannarasappa/ticker/releases/download/v${PV}/ticker-${PV}-linux-amd64.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"

RESTRICT="strip"

src_prepare() {
    # Use default unpacking for tar.gz files
    default
}

src_unpack() {
    # Create the ticker-{pv} directory in the work path
    mkdir -p "${WORKDIR}/ticker-${PV}"
    
    # Unpack the source archive into the ticker-{pv} directory
    tar -xzf "${DISTDIR}/ticker-${PV}-linux-amd64.tar.gz" -C "${WORKDIR}/ticker-${PV}"
}

src_install() {
    # Install the binary from the ticker-{pv} directory to /usr/bin
    dobin "${WORKDIR}/ticker-${PV}/ticker"
}
