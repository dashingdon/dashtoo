# Copyright 2025
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module

DESCRIPTION="Fast, lightweight, terminal-based note-taking app for developers"
HOMEPAGE="https://github.com/SourcewareLab/Toney"
SRC_URI="https://github.com/SourcewareLab/Toney/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="dev-lang/go"
DEPEND="${RDEPEND}"

S="${WORKDIR}/Toney-${PV}"

src_prepare() {
    default
    go-module_unpack

    # Debug: Show GOPATH and check module cache presence
    ewarn "GOPATH is set to: ${GOPATH}"
    if [[ -d "${GOPATH}/pkg/mod/github.com" ]]; then
        ewarn "Modules in cache:"
        ls -l "${GOPATH}/pkg/mod/github.com" || true
    else
        ewarn "Module cache directory does not exist or is empty"
    fi
}

src_compile() {
    # Explicitly disable proxy to prevent network calls during build
    export GOPROXY=off

    # Debug: print GOPROXY environment variable
    ewarn "GOPROXY is set to: ${GOPROXY}"

    go build -mod=readonly -x -o toney
}

src_test() {
    use test || return 0

    # Disable proxy for tests too
    export GOPROXY=off

    ewarn "Running tests with GOPROXY=${GOPROXY}"

    go test -mod=readonly -x ./...
}

src_install() {
    dobin toney
    dodoc README.md LICENSE
}

pkg_postinst() {
    elog "${PN} v${PV} has been installed."
    elog "Run 'toney --help' to get started with this terminal-based note-taking app."
}
