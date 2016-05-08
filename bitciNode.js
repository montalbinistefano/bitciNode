
var express    = require('express')
var bodyParser = require('body-parser')
var telnet     = require('telnet-client');
var tnConnection = new telnet();

var own        = require('./openWebNetTranslator')

var app = express()
app.use(bodyParser.json());

var ownConfig = {
    onOff: require('./config/onOff.json')
};

var ownMapper = {
    'onOff': {config: ownConfig.onOff, buildMethod: own.buildOnOffMsg, retrieveMethod: own.retrieveOnOffMsg}
}

var tnConfig = {
    host: '192.168.0.63',
    port: 20000,
    timeout: 1500,
    shellPrompt: '*#*1##'
};

function sendOwnMessage(request) {
    if (request.type == 'combine') {
        //recursive call
    }

    parser = ownMapper[request.type]

    target = parser.config[request.target]
    action = request.action

    ownRequest = own.buildOnOffMsg(target, action)
    console.log('sent: ' + ownRequest);

    tnConnection.connect(tnConfig).then(
        function(prompt) {
            tnConnection.send(ownRequest).then(
                function(res) {
                    console.log('promises result:', res)
                })
        },
        function(error) {
            console.log('promises reject:', error)
        });

    return ownRequest
}


app.route('/')
.get(function(req, res) {
    res.send(ownConfig)
})
.post(function(req, res) {
    res.send(sendOwnMessage(req.body))
});

app.listen(3000, function () {
    console.log('Start')
});
