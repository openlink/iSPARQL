#
#  This file is part of the iSPARQL project.
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
#

#AC_PREREQ(2.60)
AC_INIT(
	[iSPARQL],
	[1.40],
	[opensource@openlinksw.com],
	[isparql])
AC_CONFIG_AUX_DIR(admin)
AC_CONFIG_MACRO_DIR(admin)
AM_INIT_AUTOMAKE
AM_MAINTAINER_MODE


# --------------------------------------------------------------
# Check for python (vadpacker)
# --------------------------------------------------------------
AM_PATH_PYTHON([2.5])


# --------------------------------------------------------------
# Check for vadpacker as distributed with Virtuoso
# Allow a manual override
# --------------------------------------------------------------
AC_ARG_WITH(
  [vadpacker],
  [AS_HELP_STRING(
    [--with-vadpacker=PATH],
    [Specify the full path to the vadpacker script to use. If not provided configure will search the PATH.])],
  [VADPACKER=${withval}],
  [
    if test [ -f vadpacker/vadpacker.py ]; then
      VADPACKER="$PYTHON `pwd`/vadpacker/vadpacker.py"
    fi
  ])
AC_PATH_PROG([VADPACKER], [vadpacker.py],,)
if test "x$VADPACKER" = "x"; then
  AC_MSG_ERROR([cannot find vadpacker.py. Consider using --with-vadpacker=<PATH>.])
fi

# --------------------------------------------------------------
# Allow to specify the installation vad dir
# --------------------------------------------------------------
AC_ARG_WITH(
  [vaddir],
  [AS_HELP_STRING(
    [--with-vaddir=PATH],
    [Specify the full path to where the vad packages should be installed. Defaults to DATADIR/virtuoso/vad.])],
  [vaddir=${withval}],
  [vaddir=$datadir/virtuoso/vad])


# --------------------------------------------------------------
# We do not build the devel/filesystem vads by default
# --------------------------------------------------------------
PACK_DEVEL_VADS=no
AC_ARG_WITH(
  [fs-vads],
  [AS_HELP_STRING(
    [--with-fs-vads],
    [Enable the build of the filesystem (devel) vad packages.])],
  [PACK_DEVEL_VADS=${withval}],
  [])

# version script
versionp="sh `pwd`/gen_version.sh"

# Make all required variables available
AC_SUBST([vaddir])
AC_SUBST([versionp])

AM_CONDITIONAL([PACK_DEVEL_VADS], [test x$PACK_DEVEL_VADS = xyes])


AC_CONFIG_FILES([
  Makefile
])


AC_OUTPUT

# --------------------------------------------------------------
# Show a summary to the user
# --------------------------------------------------------------

echo ""
echo "Configuration results:"
echo "----------------------"
echo "iSPARQL version:       $VERSION"
echo "Python:                $PYTHON ($PYTHON_VERSION)"
echo "Vadpacker:             $VADPACKER"
echo ""
echo "Build filesystem vads: $PACK_DEVEL_VADS"
echo ""
echo ""
echo "Next Steps:"
echo "----------------------"
echo "Build Cartridges vad packages via:"
echo "  # make"
echo "Install Cartridges vad packages via:"
echo "  # make install"
echo ""
