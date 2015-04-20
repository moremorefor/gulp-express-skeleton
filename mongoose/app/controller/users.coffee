mongoose = require "mongoose"
User     = mongoose.model 'User'

exports.create = (req, res) ->
  user = new User req.body
  user.save (err) ->
    if err
      console.log 'error: ', err
    req.flash('success', 'Successfully created user!')
    res.redirect('/users')
