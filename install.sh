#!/bin/sh

if [ -z "$1" ]; then
  echo "Please provide python major version on commandline."
  echo "Eg: ./install.sh 2.6"
fi

PYVER="$1"

# Install kernels
mkdir -p /usr/share/phoenix-miner/kernels/phatk /usr/share/phoneix-miner/kernels/poclbm
install -m0644 ./kernels/phatk/__init__.py /usr/share/phoenix-miner/kernels/phatk/
install -m0664 ./kernels/phatk/BFIPatcher.py /usr/share/phoenix-miner/kernels/phatk/
install -m0664 ./kernels/poclbm/__init__.py /usr/share/phoenix-miner/kernels/poclbm/
install -m0664 ./kernels/poclbm/BFIPatcher.py /usr/share/phoenix-miner/kernels/poclbm/


# Install minerutil support classes
mkdir -p /usr/lib/python${PYVER}/minerutil
install -m0664 ./minerutil/ClientBase.py /usr/lib/python${PYVER}/minerutil/
install -m0664 ./minerutil/Midstate.py /usr/lib/python${PYVER}/minerutil/
install -m0664 ./minerutil/MMPProtocol.py /usr/lib/python${PYVER}/minerutil/
install -m0664 ./minerutil/__init__.py /usr/lib/python${PYVER}/minerutil/
install -m0664 ./minerutil/_newclient3420.py /usr/lib/python${PYVER}/minerutil/
install -m0664 ./minerutil/RPCProtocol.py /usr/lib/python${PYVER}/minerutil/
install -m0664 ./minerutil/client3420.py /usr/lib/python${PYVER}/minerutil/

# Install base classes
install -m0664 ./Miner.py /usr/lib/python${PYVER}/
install -m0664 ./KernelInterface.py /usr/lib/python${PYVER}/
install -m0664 ./ConsoleLogger.py /usr/lib/python${PYVER}/
install -m0664 ./QueueReader.py /usr/lib/python${PYVER}/
install -m0664 ./WorkQueue.py /usr/lib/python${PYVER}/

# Install phoenix.py as executable and symlink to /usr/bin/phoenix
install -m0755 ./phoenix.py /usr/lib/python${PYVER}/
ln -s /usr/lib/python${PYVER}/phoenix.py /usr/bin/phoenix

# Build .pyc cache for system with newly installed files.
python /usr/lib/python${PYVER}/compileall.py /usr/lib/python${PYVER}/
