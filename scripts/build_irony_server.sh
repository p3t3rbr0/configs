#!/bin/sh

#
# Build irony server for Emacs.
#
# Usage: ./build_irony_server.sh
#

set -eu

cmake \
    -DLIBCLANG_INCLUDE_DIR\=/usr/local/opt/llvm/include/ \
    -DLIBCLANG_LIBRARY\=/usr/local/opt/llvm/lib/libclang.dylib \
    -DCMAKE_INSTALL_PREFIX\=/Volumes/data/peter/.emacs.d/irony/ \
    /Volumes/data/peter/.emacs.d/elpa/irony-20200130.849/server

cmake --build . --use-stderr --config Release --target install
