var ParseDashboard = require('parse-dashboard');

let serverURL = "http://localhost:3000/parse"
if (process.env.NODE_ENV == 'production') {
  serverURL = 'https://vaxly.io/parse'
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
