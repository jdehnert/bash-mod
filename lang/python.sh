#!/usr/bin/env bash
# title         : python
# description   : module for python
# author        : jdehnert@dehnert.com
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
# Prerequisits: bash_pathtools

# If debugging us set we echo our name
if [[ $TERM_DEBUG ]]; then
  echo "${BASH_SOURCE[0]}"
fi

# Set the PYTHON env variable to python3
[[ -e /usr/local/bin/python3 ]] && export PYTHON='/usr/local/bin/python3'
[[ -e /opt/homebrew/bin/python3 ]] && export PYTHON='/opt/homebrew/bin/python3'

# Set the location of the pip config file
export PIP_CONFIG_FILE="${HOME}"/.pip/pip.conf

# Set up pyenv if installed
export PYENV_ROOT="${HOME}"/.pyenv
[[ -d "${PYENV_ROOT}"/bin ]] && path-prepend"${PYENV_ROOT}"/bin
eval "$(pyenv init -)"