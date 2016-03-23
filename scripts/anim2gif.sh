#!/bin/sh -
#
# anim2gif [-b BASENAME] file.anim...
#
# This is a simple script to convert my own animation sequence file
# which basically is a list of IM command line options, with added
# comments back into a GIF Animations.      file.anim --> file_anim.gif
#
# The animation sequence file can be extracted from an existing GIF animation
# using the "gif2anim" script. It can also be generated using some other
# porgram, or by hand.  It does not actually even need to generate a GIF
# animation but could actually be any sequence of "convert" command line
# options.  However it is designed for generating GIF aniamtions.
#
# OPTIONS
#    -b framename   basename for the individual frames
#    -g             Add '.gif' to end of basename, not '_anim.gif'
#    -c             Input frames are coalesced, ignore any initial page size
#
# The options basically perform slight modifications to the input animation
# sequence file, and assumes it is in the format generated by the "gif2anim"
# script.  They are provided for convenience only.
#
# It does not currently attempt to optimize the animation in any way, unless
# that optimization was given in the animation sequence file given.
#
####
#
# WARNING: Input arguments are NOT tested for correctness.
# This script represents a security risk if used ONLINE.
# I accept no responsiblity for misuse. Use at own risk.
#
#  Anthony Thyssen    20 April 1996
#
ORIGDIR=`pwd`
PROGNAME=`type $0 | awk '{print $3}'`  # search for executable on path
PROGDIR=`dirname $PROGNAME`            # extract directory of program
PROGNAME=`basename $PROGNAME`          # base name of program
Usage() {                              # output the script comments as docs
  echo >&2 "$PROGNAME:" "$@"
  sed >&2 -n '/^###/q; /^#/!q; s/^#//; s/^ //; 3s/^/Usage: /; 2,$ p' \
          "$PROGDIR/$PROGNAME"
  exit 10;
}
