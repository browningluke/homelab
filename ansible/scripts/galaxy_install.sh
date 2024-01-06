#!/bin/bash
ansible-galaxy install -r requirements.yml -p ./roles/galaxy
ansible-galaxy collection install -r requirements.yml
