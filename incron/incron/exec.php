<?php
require "cfg.php";

$tr=time();

$fn=$argv[1];
$inf=json_decode(file_get_contents($fn),true);

$data=array("tr"=>$tr,"in"=>$inf);
file_put_contents("{$pfx}/log/".microtime(true).".json",json_encode($data));
