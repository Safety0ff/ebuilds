# Copyright 2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

EGIT_REPO_URI="git://anongit.kde.org/${PN}"

[[ ${PV} == 9999 ]] && vcs="git-2"
inherit cmake-utils ${vcs}

DESCRIPTION="Visualizer for Valgrind Massif data files."
HOMEPAGE="https://projects.kde.org/projects/extragear/sdk/massif-visualizer"

LICENSE="LGPL-2"
SLOT="0"
[[ ${PV} == 9999 ]] || KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=media-gfx/kgraphviewer-2.1"
RDEPEND="${DEPEND}"
