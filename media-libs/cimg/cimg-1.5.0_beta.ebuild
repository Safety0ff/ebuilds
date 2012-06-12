# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

MY_P="CImg-${PV}"
S=${WORKDIR}/${MY_P}

DESCRIPTION="C++ Template Image Processing Toolkit"
HOMEPAGE="http://cimg.sourceforge.net"
SRC_URI="mirror://sourceforge/${PN}/${MY_P}.zip"

LICENSE="CeCILL-2"
SLOT="0"
KEYWORDS="~alpha amd64 ~arm ~hppa ~ia64 ~m68k ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"
IUSE=""

S=${WORKDIR}/${MY_P}

src_install() {
#	dodoc -r CHANGES.txt README.txt examples || die
#	dohtml -r html/* || die
	insinto /usr/include
	doins -r CImg.h plugins
}
