#!/usr/bin/env bash
# Ebuild for LocalSend version 1.17.0

EAPI=8

DESCRIPTION="LocalSend is a cross-platform application for sending files and messages to nearby devices."
HOMEPAGE="https://localsend.app/"
SRC_URI="https://github.com/localsend/localsend/releases/download/v${PV}/LocalSend-${PV}-linux-x86-64.AppImage"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

#https://forums.gentoo.org/viewtopic-t-1165363.html
RESTRICT="strip"

RDEPEND=""

S="${WORKDIR}"

src_prepare() {
    default
}

src_install() {
    # Create the directory for LocalSend
    mkdir -p "${D}/opt/localsend"

    ## Copy the AppImage to /opt/localsend using doins
    doins "${DISTDIR}/LocalSend-${PV}-linux-x86-64.AppImage"
    
    # Rename the AppImage to localsend.AppImage in the destination
    mv "${D}/LocalSend-${PV}-linux-x86-64.AppImage" "${D}/opt/localsend/localsend.AppImage"
    
    # Make the AppImage executable
    chmod +x "${D}/opt/localsend/localsend.AppImage"
    
    # Ensure the /usr/bin directory exists
    mkdir -p "${D}/usr/bin"
    
    # Create a symlink for easier access
    ln -s "/opt/localsend/localsend.AppImage" "${D}/usr/bin/localsend"
    
    # Ensure the /usr/share/applications directory exists
    mkdir -p "${D}/usr/share/applications"
    
    # Create a desktop entry
    cat > "${D}/usr/share/applications/localsend.desktop" <<EOF
[Desktop Entry]
Name=LocalSend
Exec=/opt/localsend/localsend.AppImage
Type=Application
Categories=Network;
EOF
}

pkg_postinst() {
    elog "LocalSend has been installed. You can run it using 'localsend'."
}
