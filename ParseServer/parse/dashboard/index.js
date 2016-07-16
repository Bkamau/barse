var ParseDashboard = require('parse-dashboard');

let serverURL = "http://localhost:3030/parse"
if (process.env.NODE_ENV == 'production') {
  serverURL = 'https://YOUR-DOMAIN-HERE/parse'
}
var dashboard = new ParseDashboard({
  "apps": [
    {
      "serverURL": serverURL,
      "appId": "MyAppIdAugustus",
      "masterKey": "MyMasterKeyFlex",
      "appName": "Augustus"
    }
  ],
  "users": [
    {
      "user": "vaxly",
      "pass": "vaxlyPass"
    }
  ]
});

module.exports = dashboard
