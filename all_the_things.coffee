restify = require 'restify'
twitter = require 'services/twitter_service'
server  = restify.createServer({
  serverName: 'All the Things', 
  headers: {'Content-Type': ->
    'text/plain'
  }
})

tweets ->
  twitter.new('@sudojosh').fetch

server.get '/:location', [tweets], (request, response) -> 
  response.send 200, {
    message: "Looking up things from #{request.uriParams.location}"
  }
  


server.listen 8080
