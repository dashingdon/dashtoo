# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="Python 3 Bindings for the NVIDIA Management Library"
HOMEPAGE="https://pypi.org/project/nvidia-ml-py"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"

# Set the version variable
PV="13.580.65"

# Correctly define the SRC_URI
SRC_URI="https://files.pythonhosted.org/packages/8f/76/ff4a297c82b463ef17e7d0100d1bee5dbe6d1416721a9170e51ffcb8ecf3/nvidia_ml_py-${PV}.tar.gz"

# The S variable will be set after unpacking
S="${WORKDIR}/nvidia-ml-py-${PV}"

src_unpack() {
    # Call the default unpack method
    default_src_unpack

    # Rename the unpacked directory
    mv "${WORKDIR}/nvidia_ml_py-${PV}" "${S}"
}

DEPEND="x11-drivers/nvidia-drivers"
RDEPEND="${DEPEND}"

src_install() {
    distutils_src_install
}
