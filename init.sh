#!/bin/bash

set -e

source common.sh

os_name=$(cat /etc/*release | grep "^ID=" | cut -f2 -d'=')

case os_name in
  
  ubuntu)
    . debian_init_setup.sh
    ;;

  fedora)
    . fedora_init_setup.sh
    ;;

  *)
    echo "Your distribution (${os_name}) aren't supported"
    exit 1
    ;;
esac


