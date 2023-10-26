#!/bin/bash
find . -maxdepth 1 -type f ! -name "LICENSE" ! -name "*.*" -delete
nasm -f elf64 "${1}" -s -o "target/build/$(basename ${1%.*}).o"
ld -o "target/bin/$(basename ${1%.*})" "target/build/$(basename ${1%.*}).o"
cp "target/bin/$(basename ${1%.*})" "$(basename ${1%.*})"