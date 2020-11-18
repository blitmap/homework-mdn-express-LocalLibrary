{ Router } = require 'express'

users = Router()

# GET users listing.
users.get '/', (req, res) ->
	res.send 'respond with a resource'

module.exports = users
