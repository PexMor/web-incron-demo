#!/bin/bash

source cfg.inc

echo "-=[ sync the web server content"
rsync -az \
    -e ssh \
    --exclude cfg.php \
    "web/" "$WEBSRV/"

echo "-=[ sync the backend incron scripts"
rsync -az \
    -e ssh \
    incron/ \
    "$SSH:$INCRONDIR/exec/"

echo "-=[ activate changes(incron) and make directories missing"
ssh $SSH "bash -s" -- <rExec.sh \
    "$WEBCHOWN" \
    "$WEBDIR" \
    "$INCRONUSER" \
    "$INCRONSH" \
    "$INCRONDIR" \
    "$WEBURL"
