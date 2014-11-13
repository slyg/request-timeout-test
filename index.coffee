Client = require('./client')
http = require('http')

# params
maxSockets = 20
timeout = 1100

# create requester client, set http conf and
http.globalAgent.maxSockets = maxSockets if maxSockets?
client = new Client('localhost:3000')
client.setTimeout(timeout)

# make requests
shoot = (refs) -> client.makeRequest references for references in refs
salvo = ['req1', 'req2', 'req3', 'req4', 'req5', 'req6']

# shoot requests
setTimeout((-> shoot salvo), 0)
setTimeout((-> shoot salvo), 500)
