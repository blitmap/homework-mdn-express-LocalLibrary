{ Router } = require 'express'

users = Router()

# GET users listing.
users.get '/', (_, res) ->
	res.send 'respond with a resource'

users.get '/cool', (_, res) ->
	res.send "You're so cool!"

module.exports = users
