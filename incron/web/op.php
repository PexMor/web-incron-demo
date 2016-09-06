<?php
    require_once("cfg.php");
    file_put_contents("$pfx/in/".microtime(true).".json",
        json_encode($_GET));
    print json_encode(array("rc"=>"ok","date"=>time()));
