# Copyright 2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

EGIT_REPO_URI="git://github.com/deeplearningais/${PN}.git"

CMAKE_IN_SOURCE_BUILD=1

[[ ${PV} == 9999 ]] && vcs="git-2"
inherit cmake-utils ${vcs}

DESCRIPTION="CUV is a C++ template and Python library which makes it easy to use NVIDIA(tm) CUDA"
HOMEPAGE="https://github.com/deeplearningais/CUV"

LICENSE="BSD"
SLOT="0"
[[ ${PV} == 9999 ]] || KEYWORDS="~amd64 ~x86"
IUSE="cimg doc python test"

DEPEND="
	virtual/cblas
	>=dev-libs/boost-1.40.0[python?]
	cimg? (
		media-libs/cimg
		x11-libs/libX11
		media-libs/libpng
	)
	python? (
		dev-lang/python
		dev-python/pyublas
		test? ( dev-python/nose )
	)
	doc? ( app-doc/doxygen )
	>=dev-util/nvidia-cuda-toolkit-4.0
        >=dev-util/nvidia-cuda-sdk-4.0
	dev-perl/Template-Toolkit
"
#cuda >= 4.0 for thrust
RDEPEND="
	virtual/cblas
	>=dev-libs/boost-1.40.0[python?]
	cimg? ( media-libs/cimg )
	python? (
                dev-lang/python
                dev-python/pyublas
                test? ( dev-python/nose )
        )
        >=dev-util/nvidia-cuda-toolkit-4.0
        >=dev-util/nvidia-cuda-sdk-4.0
"

src_prepare() {
	find | grep CMakeLists | xargs sed -i -e '/FIND_PACKAGE(\s*BLAS/d' || die
	if ! use test; then
		find | grep CMakeLists | xargs sed -i -e '/ENABLE_TESTING()/d' || die
		find | grep CMakeLists | xargs sed -i -e '/add_subdirectory(\s*test/d' || die
	fi
}


src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_build test TESTS)
		-DBLAS_LIBRARIES="$(pkg-config --libs cblas)"
		-DCBLAS_INCLUDE_DIRECTORY="$(pkg-config --variable=includedir cblas)"
		-DUSE_LOCAL_BOOST=FALSE
	)
	if use cimg; then
                mycmakeargs+=(
                        -DCUV_CIMG_BINDINGS=YES
		)
	else
		 mycmakeargs+=(
			-DCUV_CIMG_BINDINGS=FALSE
	)
	fi
	if use python; then
		mycmakeargs+=(
			-DCUV_PYTHON_BINDINGS=YES
		)
	else
		mycmakeargs+=(
			-DCUV_PYTHON_BINDINGS=FALSE
		)
	fi
	cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install
}
