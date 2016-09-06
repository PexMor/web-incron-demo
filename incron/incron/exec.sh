#!/bin/bash

SCR=$(readlink -f "$0")
DIR=$(dirname "$SCR")

source "$DIR/cfg.inc"

LCK="$BP/lock.txt"
BN=`basename "$1"`
INF="$BP/in/$BN"
LOG="$BP/log/exec.log"

date >>"$LOG"
echo "DIR=$DIR" >>"$LOG"
echo "BP=$BP" >>"$LOG"
echo "$1" >>"$LOG"
echo "BN=$BN" >>"$LOG"

if [ ! -f "$LCK" ]; then
    touch "$LCK"
    /usr/bin/php $BP/exec/exec.php "$INF" >>"$LOG" 2>&1
    echo "done" >>"$LOG"
    mv -f "$INF" "$BP/bak"
    rm -f "$LCK"
else
    echo "locked" >>"$LOG"
fi
