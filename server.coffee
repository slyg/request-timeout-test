app = require('express')()

app
  .get '/', (req, res) ->
    setTimeout ->
      res.send 'Hello World!'
    , 1000
  .listen 3000