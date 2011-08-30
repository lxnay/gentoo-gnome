# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"
GNOME2_LA_PUNT="yes"

inherit gnome2
if [[ ${PV} = 9999 ]]; then
	inherit gnome2-live
fi

DESCRIPTION="GNOME framework for accessing online accounts"
HOMEPAGE="http://www.gnome.org/"

LICENSE="LGPL-2"
SLOT="0"
IUSE="doc +introspection"
if [[ ${PV} = 9999 ]]; then
	KEYWORDS=""
else
	KEYWORDS="~amd64"
fi

# pango used in goaeditablelabel
# libsoup used in goaoauthprovider
RDEPEND="
	>=dev-libs/glib-2.29.5:2
	dev-libs/json-glib
	gnome-base/libgnome-keyring
	net-libs/libsoup:2.4
	net-libs/rest:0.7
	net-libs/webkit-gtk:3
	>=x11-libs/gtk+-3.0.0:3
	>=x11-libs/libnotify-0.7
	x11-libs/pango

	introspection? ( >=dev-libs/gobject-introspection-0.6.2 )"
DEPEND="${RDEPEND}
	dev-libs/libxslt
	dev-util/intltool
	sys-devel/gettext

	doc? ( >=dev-util/gtk-doc-1.3 )"

pkg_setup() {
	G2CONF="${G2CONF}
		--disable-static"
	DOCS="NEWS" # README is empty
}
