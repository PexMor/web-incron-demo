<?php
    header("Content-type: text/html; ; charset=utf-8");
    $debug=true;
?><!DOCTYPE html>
<html>
  <head>
    <title>MQTT skeleton</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="mobile-web-app-capable" content="yes">
    <link rel="stylesheet" href="css/mqtt.css">
    <!-- the library itself -->
    <script src="js-mqtt/mqttws31.js" type="text/javascript"></script>
    <!-- config files please configure -->
    <script src="js-mqtt/config.js" type="text/javascript"></script>
    <script src="js-mqtt/topic.js" type="text/javascript"></script>
    <!-- generic implementation to connect and reconnect -->
    <script src="js-mqtt/basic.js" type="text/javascript"></script>
    <!-- the custom script, all your code should get here -->
    <script src="js-mqtt/__main__.js" type="text/javascript"></script>
  </head>
  <body onload='MQTTConnect()'>
    Please configure contents of the js-mqtt/config.js and .../topic.js script.
    <br />
    These files contain detail on server to connect to, topic to use, user and password. It also assumes that there is <strong>mosquitto</strong> server with websockets enabled and acessible directly or via <strong>apache ws/wss proxy</strong>, alternative would be <strong>websocksify.py</strong> proxy, actually allowing it to be plain tcp socket, converted to websocket using this python script.
    <hr/>

    <form>
    Text to send:
    <input type="text" id="msg" value='{"msg":"initial-data","sub":{"a":1,"b":2}}' />
    <button onclick='sendMsgAbove();return false'>js:sendMsg()</button>
    <button onclick='clear();return false'>js:clear()</button>
    </form>

    Below is the debug details about the connection
    <?php require("header.php"); ?>
    The incomming messages

    <div id="debug" class="debug">
    Debug Messages<br />
    </div>

  </body>
</html>
