#!/bin/sh
find . -regex '.*\.\(c\|y\|cuh\|cpp\|hpp\|h\|cxx\)' -exec clang-format -style=file -i {} \;
