var mqtt;
var reconnectTimeout = 5000;

function MQTTConnect() {
    mqtt = new Paho.MQTT.Client(
        host,
        port,
        path,
        "web_" + parseInt(Math.random() * 100,
                          10));
    var options = {
        timeout: 3,
        useSSL: useTLS, // boolean
        mqttVersion: 4,
        cleanSession: cleanSession, // boolean
        onSuccess: onConnect,
        onFailure: onFailure
    };

    mqtt.onConnectionLost = onConnectionLost;
    mqtt.onMessageArrived = onMessageArrived;

    if (username != null) {
        options.userName = username;
        options.password = password;
    }
    mqtt.connect(options);
}

// --- B: debug section ---

var _mqtt_d_seqFailures=0;
var _mqtt_d_cntrConnectionLost=0;
var _mqtt_d_cntrConnect=0;
var _mqtt_d_cntrFailure=0;
var _mqtt_d_cntrMin=0;
var _mqtt_d_cntrMout=0;

function _d_(where, what) {
    var el = document.getElementById(where);
    if (el) {
        el.innerHTML=what;
    }
}

// --- E: debug section ---

// --- B: even handling section

function onFailure(message) {
    _d_('_mqtt_d_cntrFailure',++_mqtt_d_cntrFailure);
    _mqtt_d_seqFailures++;
    _d_('_mqtt_d_status',"Connection failed: '" + message.errorMessage + "', Retrying");
    if (message.errorCode!=7) {
        to=reconnectTimeout*Math.min(Math.max(Math.pow(2,seqFailures),reconnectTimeout),600*1000);
        _d_('_mqtt_d_curTimeout',(to/1000));
        setTimeout(MQTTconnect, to);
    };
}

function onConnect() {
    seqFailures=0;
    _d_('_mqtt_d_cntrConnect',++_mqtt_d_cntrConnect);
    _d_('_mqtt_d_status','Connected to ' + host + ':' + port);
    _d_('_mqtt_d_topic',topic);
    mqtt.subscribe(topic, {qos: 0});
    if (typeof(cbObj)!=="undefined") {
        cbObj.cb("con");
    }
}

function onConnectionLost(response) {
    _d_('_mqtt_d_cntrConnectionLost',++_mqtt_d_cntrConnectionLost);
    if (typeof(cbObj)!=="undefined") {
        cbObj.cb("dis");
    }
    to=reconnectTimeout*Math.min(Math.max(Math.pow(2,seqFailures),reconnectTimeout),600*1000);
    console.log("reconnectTimeout = "+to);
    _d_('_mqtt_d_curTimeout',(to/1000));
    setTimeout(MQTTConnect, to);
};

function onMessageArrived(message) {
    _d_('_mqtt_d_cntrMin',++_mqtt_d_cntrMin);
    var topic = message.destinationName;
    var payload = message.payloadString;
    if (typeof(cbObj)!=="undefined") {
        cbObj.cb("msg",message);
    }
};

// --- B: even handling section

function sendMsg(aTopic,aMsg) {
    _d_('_mqtt_d_cntrMout',++_mqtt_d_cntrMout);
    message = new Paho.MQTT.Message(aMsg);
    message.destinationName = aTopic;
    mqtt.send(message);
};
