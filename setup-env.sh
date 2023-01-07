#!/bin/bash

ANSIBLEROOT="$(git rev-parse --show-toplevel)/ansible"

export ANSIBLE_NOCOWS=1
export ANSIBLE_CONFIG="$ANSIBLEROOT/ansible.cfg"
