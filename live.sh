#!/usr/bin/env bash


compile_and_run() {
    filename=$1
    (set -x && chpl ${filename}.chpl && ./$filename)
}


f=$1
fswatch -o $f.chpl | (while read; do compile_and_run $f || true; done)
