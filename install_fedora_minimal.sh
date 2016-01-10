#!/bin/bash

source `dirname $0`/misc.sh

run_once sudo qubes-dom0-update --enablerepo=qubes*testing qubes-template-fedora-21-minimal
