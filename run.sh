#!/usr/bin/env bash

compile_and_run() {
    fullpath=$1
    filename=$(basename $fullpath)
    dir=$(dirname $fullpath)
    shift
    execname=$(basename -s .chpl $filename).out
    execfile=$dir/$execname

    stampfile=$dir/.$execname.stamp
    lastedittime=$(stat -f "%c" $fullpath)
    # no execfile or no stamp file or stampfile has older time than last edit time
    if [[ ! -f $execfile || ! -f $stampfile || $(< $stampfile) -lt $lastedittime ]]; then
        echo $lastedittime > $stampfile
        (cd $dir && set -x && chpl $filename -o $execname || rm -f $execname)
    fi
    if [[ -f $execfile ]]; then
        (cd $dir && set -x && ./$execname $@)
    fi
}

compile_and_run $@
