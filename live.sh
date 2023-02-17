#!/usr/bin/env bash


compile_and_run() {
    filename=$(basename $1)
    dir=$(dirname $1)
    execname=live.out
    (cd $dir && echo "" && set -x && chpl $filename -o $execname && ./$execname)
}


f=$1
fswatch -o $f -n1 | (while read; do compile_and_run $f || true; done)
