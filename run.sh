#!/usr/bin/env bash

compile_and_run() {
    filename=$(basename $1)
    dir=$(dirname $1)
    shift
    execname=run.out
    (cd $dir && echo "" && set -x && chpl $filename -o $execname && ./$execname $@)
}

compile_and_run $@
