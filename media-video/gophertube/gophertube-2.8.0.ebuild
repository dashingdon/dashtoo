EAPI=8

inherit go-module

EGO_SUM=(
	"github.com/BurntSushi/toml v1.5.0"
	"github.com/BurntSushi/toml v1.5.0/go.mod"
	"github.com/chzyer/logex v1.2.1"
	"github.com/chzyer/logex v1.2.1/go.mod"
	"github.com/chzyer/readline v1.5.1"
	"github.com/chzyer/readline v1.5.1/go.mod"
	"github.com/chzyer/test v1.0.0"
	"github.com/chzyer/test v1.0.0/go.mod"
	"github.com/davecgh/go-spew v1.1.1"
	"github.com/davecgh/go-spew v1.1.1/go.mod"
	"github.com/pmezard/go-difflib v1.0.0"
	"github.com/pmezard/go-difflib v1.0.0/go.mod"
	"github.com/stretchr/testify v1.10.0"
	"github.com/stretchr/testify v1.10.0/go.mod"
	"github.com/urfave/cli-altsrc/v3 v3.0.1"
	"github.com/urfave/cli-altsrc/v3 v3.0.1/go.mod"
	"github.com/urfave/cli/v3 v3.3.8"
	"github.com/urfave/cli/v3 v3.3.8/go.mod"
	"golang.org/x/sys v0.0.0-20220310020820-b874c991c1a5/go.mod"
	"golang.org/x/sys v0.34.0"
	"golang.org/x/sys v0.34.0/go.mod"
	"gopkg.in/yaml.v3 v3.0.1"
	"gopkg.in/yaml.v3 v3.0.1/go.mod"
	)
go-module_set_globals

DESCRIPTION="GopherTube - A video streaming platform"
HOMEPAGE="https://github.com/KrishnaSSH/GopherTube"
SRC_URI="https://github.com/KrishnaSSH/GopherTube/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	${EGO_SUM_SRC_URI}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
RESTRICT="strip"

#RDEPEND="

#"

RDEPEND="
    dev-lang/go
    media-gfx/chafa
"

S="${WORKDIR}/GopherTube-${PV}"

src_prepare() {

    # Call eapply_user to apply any user-defined patches
    eapply_user
    # Ensure Go modules are enabled
    export GO111MODULE=on
}

src_compile() {

    go mod tidy

    go build -o gophertube
}

src_install() {
    dobin gophertube
    dodoc README.md
}

pkg_postinst() {
    elog "GopherTube has been installed. You can run it using the command 'gophertube'."
}
