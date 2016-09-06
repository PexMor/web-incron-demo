SSH=root@server
APPNAME=inc-test
WEBURL="http://server/$APPNAME/op.php?id=ahoj"
WEBDIR=/var/www-sites/server/$APPNAME
WEBSRV=root@server:$WEBDIR
INCRONDIR=/var/www-data/incron/$APPNAME
INCRONSH=$INCRONDIR/exec/exec.sh
WEBCHOWN=www-data:www-data
INCRONUSER=dummy

echo "-=[ B:Example Variables ]=------"
grep "^[A-Z_][A-Z_]*=" cfg.inc | while IFS="$IFS=" read NAME REST; do
    eval "VAL=\$$NAME"
    echo "$NAME = '$VAL'"
done
echo "-=[ E:Example Variables ]=------"


if [ -f "$HOME/.example.cfg" ]; then
    source "$HOME/.example.cfg"
    echo "-=[ B:Actual Variables ]=------"
    grep -h "^[A-Z_][A-Z_]*=" cfg.inc "$HOME/.example.cfg" | cut -d= -f1 | sort | uniq | while IFS="$IFS=" read NAME REST; do
        eval "VAL=\$$NAME"
        echo "$NAME = '$VAL'"
    done
    echo "-=[ E:Actual Variables ]=------"
fi


echo -n "press enter to continue or Ctrl-C to interrupt"
read ENTER

