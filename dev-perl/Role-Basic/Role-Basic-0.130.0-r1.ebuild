# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DIST_AUTHOR=OVID
DIST_VERSION=0.13
inherit perl-module

DESCRIPTION="Just roles. Nothing else"

LICENSE="Artistic-2"
SLOT="0"
KEYWORDS="amd64 ~arm ~hppa ppc ~riscv x86"

RDEPEND=""
BDEPEND="${RDEPEND}
	dev-perl/Module-Build
	test? ( virtual/perl-Test-Simple )
"
