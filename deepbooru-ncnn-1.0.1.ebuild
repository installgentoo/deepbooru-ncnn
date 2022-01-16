# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="deepbooru tagger using ncnn"
HOMEPAGE="https://github.com/installgentoo/deepbooru-ncnn"
SRC_URI="https://github.com/installgentoo/deepbooru-ncnn/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
RDEPEND="dev-libs/ncnn
		media-gfx/imagemagick"
DEPEND="${RDEPEND}"

src_prepare() {
	CMAKE_USE_DIR="${S}"
	cmake_src_prepare

	# combine model
	cat model-dd/resnet_dd.bina? > model-dd/resnet_dd.bin
	rm model-dd/resnet_dd.bina?
	# Update all paths to match installation for models.
	sed "s/string model = \"model-dd\"/string model = \"${EPREFIX}\/usr\/share\/${PN}\"/" -i dd_main.cxx || die
}

src_configure() {
	cmake_src_configure
}

src_install() {
	dobin "${BUILD_DIR}"/dd-ncnn
	insinto /usr/share/${PN}
	doins -r model-dd/.
}
