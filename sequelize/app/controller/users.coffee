db    = require '../models'
Utils = require '../libs/utils'

exports.create = (req, res) ->
  user = db.User.build req.body
  user
    .save()
    .then () ->
      req.flash('success', 'Successfully created user!')
      res.redirect('/users')
    .catch (err) ->
      if err
        console.log 'error: ', err
        Utils.setFlashErrors req, err.errors
        res.redirect('/users')
