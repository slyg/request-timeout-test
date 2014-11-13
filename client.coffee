request = require('request')
uuid = require('node-uuid')
url = require('url')

Client = (host) ->
  @host = host

Client.prototype.setTimeout = (timeout) ->
  @timeout = timeout

Client.prototype.makeRequest = (ref) ->

  id = uuid.v1()
  timeout = (ref == 'req5') ? 500 : undefined

  console.time id

  request(
    url : url.format(
      protocol : 'http'
      host : @host
      query :
        ref : ref
    )
    timeout : timeout || @timeout
    ,
    (err, response, body) ->
      console.log ref
      console.log 'err: ', err if err?
      console.timeEnd id
      console.log '----------'
  )

module.exports = Client