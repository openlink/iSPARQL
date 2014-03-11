#!/bin/bash
#
#   This file is part of the iSPARQL project
#
#   Copyright (C) 2005-2014 OpenLink Software
#
#   This project is free software; you can redistribute it and/or modify it
#   under the terms of the GNU General Public License as published by the
#   Free Software Foundation; only version 2 of the License, dated June 1991.
#
#   This program is distributed in the hope that it will be useful, but
#   WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
#   General Public License for more details.
#
#   You should have received a copy of the GNU General Public License along
#   with this program; if not, write to the Free Software Foundation, Inc.,
#   51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
#

#
#  Get build date
#
BUILD_DATE=`date +"%Y-%m-%d %H:%M"`

#
#  Generate version number
#
# First we try to get the version from the last tag (tag name minus "v" prefix + _gitN where N is the number of commits since the tag)
GIT_V=`git describe --tags --long --always 2>/dev/null | sed -e 's/-/./' -e 's/-g/-/g' -e 's/^v//'`


#
# If we are not in a git clone GIT_V will be empty. In that case we use the hard-coded version from version
#
if test "X$GIT_V" != "X"
then
    echo $GIT_V/$BUILD_DATE > version
fi

#
#  Return version without build date
#
cat version | sed -e 's,/.*$,,'

exit 0
