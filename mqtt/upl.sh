#!/bin/bash

RPATH=/var/www-sites
PFX=$HOME/git/work/mqtt/qr-srv

XSSL=nonssl
XSSL=ssl
SITE=get
SPATH=test

function once() {
echo "uploading js mqtt paho library"
rsync $PFX/data/paho.javascript-1.0.1/*.js \
    root@tms:$RPATH/$XSSL/$SITE/$SPATH/js-mqtt/
}

echo "uploading the site itself"
rsync -avz --exclude \*.sh --exclude \*~ --exclude data --exclude \*.md --exclude siteSetup \
    . root@tms:$RPATH/$XSSL/$SITE/$SPATH/

once

