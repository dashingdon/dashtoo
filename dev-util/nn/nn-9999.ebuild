# Copyright 2025
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="Minimal command-line note manager"
HOMEPAGE="https://github.com/joaocgduarte/nn"
EGIT_REPO_URI="https://github.com/joaocgduarte/nn.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="
    app-misc/fzf:0.62.0
    app-text/glow:2.0.0
    sys-apps/ripgrep:14.1.1
    dev-vcs/git:2.50.0
"

src_prepare() {
    default

    # Remove any previously injected CONFIG_FILE and NOTE_DIR assignments
    sed -i \
        -e '/^CONFIG_FILE=.*\.nnconfig/d' \
        -e '/^NOTE_DIR=.*notes/d' \
        nn || die "Failed to remove config assignments"

    # Patch heredoc defaults in config creation
    sed -i \
        -e 's|NOTE_DIR="\\$HOME/home/notes"|NOTE_DIR="\\$HOME/.config/nn/notes"|' \
        -e 's|CONFIG_FILE="\\$HOME/.nnconfig"|CONFIG_FILE="\\$HOME/.config/nn/.nnconfig"|' \
        nn || die "Failed to patch heredoc config paths"

    # Add sane defaults before `set -euo pipefail`
    sed -i '/^set -euo pipefail/i\
CONFIG_FILE="${CONFIG_FILE:-$HOME/.config/nn/.nnconfig}"\
NOTE_DIR="${NOTE_DIR:-$HOME/.config/nn/notes}"\
mkdir -p "$(dirname \"$CONFIG_FILE\")"\
mkdir -p \"$NOTE_DIR\"\
' nn || die "Failed to insert default config path setup"

    # Replace open_file() with the original version (no templates)
    sed -i '/^open_file()/,/^}/c\
open_file() {\
    mkdir -p "$1"\
    cd "$1" || exit\
\
    timestamp="$(date +\"%Y%m%d%H%M%S\")"\
    {\
        echo "# $filename"\
        echo\
        echo\
        echo "References:"\
        echo "- " \
    } >> "$1/$timestamp $filename.md"\
\
    $E "$1/$timestamp $filename.md"\
}\
' nn || die "Failed to restore open_file()"
}

src_install() {
    dobin nn
    dodoc README.md
}

pkg_postinst() {
    elog "nn now uses:"
    elog "  Config: \$HOME/.config/nn/.nnconfig"
    elog "  Notes:  \$HOME/.config/nn/notes"
}
