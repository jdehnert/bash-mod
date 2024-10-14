#!/usr/bin/env bash
# title         : brew
# description   : momebrew setup and configuration module
# author        : jdehnert@dehnert.com
# date          : 2024/09/17
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
# TODO 
# Prerequisits: bash_pathtools

# If debugging us set we echo our name
if [[ $TERM_DEBUG ]]; then
  echo "${BASH_SOURCE[0]}"
fi

# Set the architecture
ARCH=$(uname -m)

# Set variables for brew and cask
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
#export HOMEBREW_GITHUB_API_TOKEN=d2a2f8d56eaa5abd007e9fc7488b6030f460e979


# Set paths based on where Homebrew is located
if [[ "${ARCH}" == arm64 ]] && [[ "${OSTYPE}" =~ ^darwin ]] ; then
  if [[ -d "$(brew --prefix)"/bin ]] ; then
    path-prepend "$(brew --prefix)"/bin
  fi
  if [[ -d "$(brew --prefix)"/share/man ]] ; then
    path-prepend "$(brew --prefix)"/share/man/ MANPATH
  fi
fi

# install homebrew if it's missing
if ! command -v brew &> /dev/null ; then
  ptintf "Installing %s\n" Homebrew
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || { printf "Error: Unable to %s\n" "install homebrew" ; exit 1 }
fi

# Bash completion for homebrew
if [[ -e "$(brew --prefix)"/etc/bash_completion.d/brew ]]; then
  # shellcheck source=/dev/null
  source "$(brew --prefix)"/etc/bash_completion.d/brew
fi

# Install and upgrade all dependencies from the Brewfile
# --global => Read the Brewfile from ~/.Brewfile or the HOMEBREW_BUNDLE_FILE_GLOBAL environment variable, if set.
if [[ -f "${home}/.Brewfile" ]]; then
  echo "Updating homebrew bundle"
  brew bundle --global
fi

# Add tab completion to terraform
if [[ -e "$(brew --prefix)"bin/terraform ]]; then
  complete -C "$(brew --prefix)"/bin/terraform -install-autocomplete
fi

# Add bash completion (now from homebrew since macos defaults to zsh now )
if [[ -d "$(brew --prefix)"/etc/bash_completion.d ]]; then
   for SRV in $("$(brew --prefix)"/etc/bash_completion.d/*) ; do
     [[ -r "${SRV}" ]] && source "${SRV}"
  done
fi

# Run this if we have broot installed
if command -v broot &>/dev/null ; then
  if [[ -r "${HOME}"/.config/broot/launcher/bash/br ]]; then
      source "${HOME}"/.config/broot/launcher/bash/br
  fi
fi

# Brew aliases
alias bs='brew search'
alias bin='brew install'
alias bun='brew uninstall'
alias brm='brew uninstall'
alias b\?='brew info'
alias bup='brew update'
alias bdr='brew doctor'
alias bcs='brew cask search'
alias bcin='brew cask install'
alias bcun='brew cask uninstall'
alias bcrm='brew cask uninstall'
alias bc\?='brew cask info'
alias bcup='brew cask update'
alias bcdr='brew cask doctor'

