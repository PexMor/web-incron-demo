var cbObj = {};

cbObj.cb = function(op, par) {
    switch (op) {
    case "msg":
        setTimeout(function() {
            onMsg(op, par)
        }, 0);
        break;
    case "con":
        setTimeout(function() {
            onCon()
        }, 0);
        break;
    }
}

function onMsg(op, par) {
    var el=document.getElementById("debug");
    if (el) {
        el.innerHTML+="<span style='font-size:8pt'>"+(new Date())+"</span><br />\n";
    }
    try {
        var json=JSON.parse(par.payloadString);
        if (el) {
            el.innerHTML+=JSON.stringify(json)+"<br />\n";
        }
    } catch (err) {
        if (el) {
            el.innerHTML+="arrived: "+par.payloadString+"<br />\n";
            el.innerHTML+="error: "+err+"<br />\n";
        }
    }
    var el=document.getElementById("inMsg");
    if (el) {
        el.innerHTML=par.payloadString;
    }
}

function onCon() {
    var el=document.getElementById("debug");
    if (el) {
        el.innerHTML+="__refresh__<br />\n";
    }
}

function clear() {
    var el=document.getElementById("debug");
    if (el) {
        el.innerHTML="";
    }
}

function sendMsgAbove(altTopic) {
    var el=document.getElementById("msg");
    if (el) {
        if (altTopic) {
            sendMsg(altTopic,el.value);
        } else {
            topic = topic.replace("#","test");
            sendMsg(topic,el.value);
        };
    }
}