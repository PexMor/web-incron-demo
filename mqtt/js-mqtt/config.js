var username = "web";
var password = "pass";
var host = location.hostname;
var protocol = location.protocol;
var port = 1 * location.port;
var useTLS = true;
if (protocol === "http:") {
    useTLS=false;
    if (port === 0) {
        port = 80;
    }
} else {
    useTLS=true;
    if (port === 0) {
        port = 443;
    }
}
var cleanSession = false;
var path = "/mqtt/mqtt";
var topic;
