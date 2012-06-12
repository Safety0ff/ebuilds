EAPI=2
inherit cmake-utils

DESCRIPTION="a portable Open Source library to import various well-known 3D model formats in an uniform manner."
HOMEPAGE="http://assimp.sourceforge.net"
SRC_URI="mirror://sourceforge/${PN}/assimp-2.0/assimp--2.0.863-sdk.zip"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 ~x86"

S="${WORKDIR}/assimp--2.0.863-sdk"
