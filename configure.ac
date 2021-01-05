#
#  This file is part of the iSPARQL project.
#
#  Copyright (C) 2005-2021 OpenLink Software
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
	[1.50],
	[opensource@openlinksw.com],
	[isparql])
AC_CONFIG_AUX_DIR(admin)
AC_CONFIG_MACRO_DIR(admin)
AM_INIT_AUTOMAKE
AM_MAINTAINER_MODE


# --------------------------------------------------------------
# Check for python (vadpacker)
# --------------------------------------------------------------
AM_PATH_PYTHON([2.7])


# --------------------------------------------------------------
# Check for vadpacker as distributed with Virtuoso
# Allow a manual override
# --------------------------------------------------------------
AC_ARG_WITH(
  [vadpacker],
  [AS_HELP_STRING(
    [--with-vadpacker=DIR],
    [Specify the full path to the vadpacker script to use. If not provided configure will search the PATH.])],
    [
	case "$withval" in
	yes|no)
		vadpacker_dir=$srcdir/vadpacker
		;;
	*)
		vadpacker_dir="$withval"
		;;
	esac
    ],[vadpacker_dir=$srcdir/vadpacker])

abs_vadpacker_dir=`cd "$vadpacker_dir" && pwd`
AC_PATH_PROG([VADPACKER], [vadpacker.py], notfound, ["$abs_vadpacker_dir:$PATH"])
if test "x$VADPACKER" = "xnotfound"; then
  AC_MSG_ERROR([cannot find vadpacker.py. Consider using --with-vadpacker=DIR])
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
