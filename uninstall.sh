#!/bin/sh

if [ -z "$1" ]; then
  echo "Please provide python major version on commandline."
  echo "Eg: ./install.sh 2.6"
  exit 1
fi

PYVER="$1"

rm -rfv /usr/share/phoenix-miner /usr/lib/python${PYVER}/minerutil
rm -fv /usr/lib/python${PYVER}/Miner.py? \
  /usr/lib/python${PYVER}/KernelInterface.py? \
  /usr/lib/python${PYVER}/ConsoleLogger.py? \
  /usr/lib/python${PYVER}/QueueReader.py? \
  /usr/lib/python${PYVER}/WorkQueue.py? \
  /usr/lib/python${PYVER}/phoenix.py? \
  /usr/bin/phoenix

