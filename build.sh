#!/bin/bash
nasm -f elf64 "${1}" -o "target/$(basename ${1%.*}).o"
ld -o "target/$(basename ${1%.*})" "target/$(basename ${1%.*}).o"
