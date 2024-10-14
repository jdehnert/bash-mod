#!/usr/bin/env bash
# title         : docker
# description   : docker module
# author        : jdehnert@ehnert.com
# date          : 2024/09/19
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
# Notes 
# Changes 
# Todo 
# Prerequisits: 

# If debugging us set we echo our name
if [[ $TERM_DEBUG ]]; then
  echo "${BASH_SOURCE[0]}"
fi

# Docker ealiases
##########################################
alias d='docker'
alias dps='docker ps'
alias dr='docker run'
alias dex='docker exec'

