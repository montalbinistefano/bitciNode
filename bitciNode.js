
var express      = require('express')
var colors       = require('colors')
var bodyParser   = require('body-parser')
var Promise      = require('promise');

var telnet       = require('telnet-client');
var ownParser    = require('./openWebNetParser')

var app = express()
app.use(bodyParser.json());

var ownConfig = {
    onOff: require('./config/onOff.json')
};

var ownMapper = {
    'onOff': {config: ownConfig.onOff, buildMethod: ownParser.buildOnOffMsg, retrieveMethod: ownParser.retrieveOnOffMsg}
}

var tnParam = {
    host: '192.168.0.63',
    port: 20000,
    shellPrompt: '*#*1##',
    timeout: 5000,
};

function sendOwnMessage(request) {
    if (request.type == 'combine') {
        return sendCombinedOwnMessage(request.action)
    } else {
        return new Promise(function(resolve, reject) {

            var parser = ownMapper[request.type]
            if (parser === undefined) {
                reject({status: "translateError",summary: "no matching parser", detail: request.type})
            }

            var target = parser.config[request.target]
            if (target === undefined) {
                reject({status: "bitcinodeError",summary: "no matching target", detail: request.target})
            }

            var action = request.action
            var ownRequest = parser.buildMethod(target, action)
            if (ownRequest === undefined) {
                reject({status: "parseError",summary: "no matching action", detail: request.action})
            }

            var tnConnection = new telnet();
            setTimeout(function() {
                tnConnection.connect(tnParam).then(function(prompt) {
                    tnConnection.send(ownRequest, {waitfor: "##"}).then(function(ownResponse) {
                        resolve(parser.retrieveMethod(ownResponse, request))
                    }).catch(function(e) {
                        reject({status: "tnError", summary: "fail send", detail:e})
                    })
                }).catch(function(e) {
                    reject({status: "tnError",summary: "fail connect", detail:e})
                })
            }, request.delay);
        });
    }
}

function sendCombinedOwnMessage(requestList) {
    return Promise.all(requestList.map(sendOwnMessage))
}

app.route('/')
.get(function(req, res) {
    res.send(ownConfig)
})
.post(function(req, res) {
    sendOwnMessage(req.body).then(function(parsedOwnresponse) {
        console.log((new Date().toString() + ' - ' + JSON.stringify(req.body) + ' - ' + JSON.stringify(parsedOwnresponse)).green)
        res.send(parsedOwnresponse)
    }).catch(function(e) {
        e.input = req.body
        console.error((new Date().toString() + ' - ' + JSON.stringify(e)).red)
        res.send(e)
    })
});

app.listen(3000, function () {
    console.log('Start bitciNode on 192.168.0.130:3000\n'.cyan)
});
