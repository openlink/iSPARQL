#
#  This file is part of the iSPARQL Project.
#
#  Copyright (C) 2005-2014 OpenLink Software
#
#  This project is free software; you can redistribute it and/or modify it
#  under the terms of the GNU General Public License as published by the
#  Free Software Foundation; only version 2 of the License, dated June 1991.
#
#  This program is distributed in the hope that it will be useful, but
#  WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
#  General Public License for more details.
#
#  You should have received a copy of the GNU General Public License along
#  with this program; if not, write to the Free Software Foundation, Inc.,
#  51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
#

ACLOCAL_AMFLAGS = -I admin

NEED_VERSION	= 05.10.3038

#
#  Generated files
#
BUILT_SOURCES = \
	version


#
#  Cartridge files
#
ISPARQL_FILES = \
	*.html \
	*.vsp \
	images/*.gif \
	images/*.jpg \
	images/*.png \
	js/*.js \
	oat/images/*.gif \
	oat/images/*.png \
	oat/images/markers/*.png \
	oat/styles/*.css \
	oat/styles/hover.htc \
	oat/js/*.js \
	oat/xslt/*.xsl \
	sql/*.sql \
	styles/*.css \
	xslt/*.xsl \
	version

vad_DATA = isparql_dav.vad

if PACK_DEVEL_VADS
vad_DATA += isparql_filesystem.vad
endif

# Rules to create our vads
isparql_dav.vad: $(ISPARQL_FILES) isparql_sticker.xml Makefile
	@VADPACKER@ \
		-o isparql_dav.vad \
		--var="NEED_VERSION=$(NEED_VERSION)" \
		--var="VERSION=`@versionp@`" \
		--var="BASE_PATH=/DAV/VAD" \
		--var="TYPE=dav" \
		--var="ISDAV=1" \
		isparql_sticker.xml

isparql_filesystem.vad: $(ISPARQL_FILES) isparql_sticker.xml Makefile
	@VADPACKER@ \
		-o isparql_filesystem.vad \
		--var="NEED_VERSION=$(NEED_VERSION)" \
		--var="VERSION=`@versionp@`" \
		--var="BASE_PATH=/vad/vsp" \
		--var="TYPE=http" \
		--var="ISDAV=0" \
		isparql_sticker.xml

sticker: $(ISPARQL_FILES) isparql_sticker.xml Makefile
	@VADPACKER@ \
		--print-sticker \
		--var="NEED_VERSION=$(NEED_VERSION)" \
		--var="VERSION=`@versionp@`" \
		--var="BASE_PATH=/DAV/VAD" \
		--var="TYPE=dav" \
		--var="ISDAV=1" \
		isparql_sticker.xml

CLEANFILES = *.vad

EXTRA_DIST =  \
	$(ISPARQL_FILES) \
	autogen.sh \
	gen_version.sh \
	isparql_sticker.xml \
	oat \
	defaults \
	version \
	vadpacker

version:
	$(SHELL) gen_version.sh

# ----------------------------------------------------------------------
#
#  Maintainers only
#
# ----------------------------------------------------------------------

MAINTAINERCLEANFILES    = aclocal.m4 configure


if MAINTAINER_MODE

#
#  Create an official release package
#
release:
	$(MAKE) distcheck

#
#  Create a source snapshot package
#
snapshot:
	$(MAKE) dist distdir=$(PACKAGE)-`date +"%Y%m%d"`


#
#  Generate ChangeLog
#
.PHONY: changelog
changelog:
	git2cl --since=2009/10/17 --format='%s%n%n%b%n' --strip-tab --strip-cherry-pick > ChangeLog

endif
