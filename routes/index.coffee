{ Router } = require 'express'

index = Router()

# GET home page.
index.get '/', (req, res) ->
	res.render 'index', title: 'Express'

module.exports = index
