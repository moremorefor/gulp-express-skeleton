express = require('express')
router = express.Router()
controller = require '../controller/users'

# middleware
router.use (req, res, next) ->
  console.log '[users] Time: ', Date.now()
  next()

router.route '/'
  .get (req, res) ->
    flash_message = req.flash('success')
    unless flash_message.length > 0
      flash_message = undefined
    res.render 'users/create', { messages: flash_message, title: 'Signup'}
  .post controller.create

module.exports = router
