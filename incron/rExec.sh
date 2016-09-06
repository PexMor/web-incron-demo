#!/bin/bash

WEBCHOWN=$1
WEBDIR=$2
INCRONUSER=$3
INCRONSH=$4
INCRONDIR=$5
WEBURL=$6

INCRONWATCHDIR=$INCRONDIR/in
INCRONLOGDIR=$INCRONDIR/log
INCRONSHDIR=$INCRONDIR/exec
INCRONBAKDIR=$INCRONDIR/bak

echo INCRONWATCHDIR=$INCRONWATCHDIR

rm -rf "$INCRONWATCHDIR"
mkdir -p $INCRONWATCHDIR
chown $WEBCHOWN $INCRONWATCHDIR
chmod g+w $INCRONWATCHDIR
#chmod 0777 $INCRONWATCHDIR

rm -rf "$INCRONLOGDIR"
mkdir -p $INCRONLOGDIR
chown $INCRONUSER $INCRONLOGDIR

rm -rf "$INCRONBAKDIR"
mkdir -p $INCRONBAKDIR
chown $INCRONUSER $INCRONBAKDIR
#chmod 0777 $INCRONLOGDIR

mkdir -p $INCRONSHDIR

LS='ls --color'
$LS -ld $WEBDIR
$LS -l $WEBDIR
$LS -ld $INCRONWATCHDIR
$LS -l $INCRONWATCHDIR
$LS -ld $INCRONSHDIR
$LS -l $INCRONSHDIR

echo -e "<?php\n\$pfx=\"$INCRONDIR\";\n" >$WEBDIR/cfg.php
echo -e "<?php\n\$pfx=\"$INCRONDIR\";\n" >$INCRONSHDIR/cfg.php
echo -e "BP=\"$INCRONDIR\"\n" >$INCRONSHDIR/cfg.inc

sudo -H -u $INCRONUSER bash -s <<EOF
echo "-=[ incron handling"
UNAME=\$(id -u -n)
INCRONF="/var/spool/incron/\$UNAME"
echo "\$INCRONF"
echo "---"
INST=\$(cat "\$INCRONF" | grep "$INCRONWATCHDIR ")
if [[ "x\$INST" != "x" ]]; then
    echo "incron already installed"
    echo "---"
    echo \$INST
    echo "---"
else
    echo "installing incron for '$DIR'"
    echo "-=[ folowing line to be installed"
    CMD="$INCRONWATCHDIR IN_CLOSE_WRITE $INCRONSH \\\$@/\\\$#"
    echo "\$CMD"
    echo "\$CMD" >>"\$INCRONF"
    echo "---"
    cat "\$INCRONF" | grep "$INCRONWATCHDIR "
    echo "---"
fi

incrontab --reload

sleep 1
echo '{"info":"some"}' >$INCRONWATCHDIR/abc.json
sleep 1
curl -k $WEBURL
EOF

