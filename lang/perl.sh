#!/usr/bin/env bash
# title         : perk.sh
# description   : Perl modile
# author        : jdehnert@dehnert.com
# date          : 2024/10/14
# version       : 0.1.0
# bash_version  : >= 4.0
#============================================================================
#set -n             # Uncomment to check your syntax without execution.
set -o errexit      # Exit on most errors (see the manual)
set -o errtrace     # Make sure any error trap is inherited
set -o nounset      # Disallow expansion of unset variables
set -o pipefail     # Use last non-zero exit code in a pipeline
#set -o xtrace      # Trace the execution of the script (debug)
#============================================================================
# Notes: 
# Changes: 
# Todo: 
# Prerequisits: 

# If debugging us set we echo our name
if [[ ${TERM_DEBUG} ]]; then
  echo "{BASH_SOURCE[0]"
fi

# Set up perl 5 config if installed
if [[ -d "${HOME}"/perl5 ]] ; then
PATH="/${HOME}/jdehnert/perl5/bin${PATH:+:${PATH}}"; export PATH;
  PERL5LIB="${HOME}/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
  PERL_LOCAL_LIB_ROOT="${HOME}/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
  PERL_MB_OPT=(--install_base "${HOME}/perl5"); export PERL_MB_OPT;
  PERL_MM_OPT="INSTALL_BASE=${HOME}/perl5"; export PERL_MM_OPT;
fi
