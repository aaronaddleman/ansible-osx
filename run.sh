#!/usr/bin/env sh

if [ "$1" = "check" ]; then
    ansible-playbook -i "localhost," -c local ansible_osx.yml --ask-become-pass --check
fi

if [ "$1" = "install" ] ; then
    ansible-playbook -i "localhost," -c local ansible_osx.yml --ask-become-pass
fi
