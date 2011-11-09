class TwitterService
  constructor: (@location_or_handle) ->
    @client = require 'http'
    if @location_or_handle.match(/^@[\w]+/)
      @options = {
        host: 'api.twitter.com',
        port: 80,
        path: "/1/statuses/user_timeline.json?screen_name=#{@location_or_handle}"
      }
    else
      @options = {
        host: 'search.twitter.com',
        port: 80,
        path: 'search.json'
      }
    
    @options = {
      host: 'api.twitter.com',
      port: 80,
      path: '/search.json',
    }
      
  fetch: (@location_or_handle) ->
    @client.get(@options, (response) -> 
      console.log "TWITTER: #{JSON.parse(response.body)}"
           
