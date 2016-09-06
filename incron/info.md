# Web with incron backend

This repository offers contains a sample application
that depicts the principal paradigm how to decouple
web front end and task execution under certain user
communication through incron dir watch.

The script deploy.sh is driven by cfg.inc (same dir;
or ~/.example.cfg that can override the values in
above mentioned file).

What the script actually does is:
1. deploys the web part
2. generate config to be read by php
3. deploys the exec.sh and exec.php
4. creates config cfg.inc and cfg.php
   to be read by bash and php scripts

5. does local test by creating simple json
   inside $INCRONWATCHDIR
6. does web test by simulating XHR request to
   WEBURL="http://server/$APPNAME/op.php?id=xxx"
   which in sequence creates json again
   inside $INCRONWATCHDIR
