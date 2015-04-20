express = require('express')
router = express.Router()
controller = require '../controller/users'

# middleware
router.use (req, res, next) ->
  console.log '[users] Time: ', Date.now()
  next()

router.route '/'
  .get (req, res) ->
    res.render 'users/create', {title: 'Signup'}
  .post controller.create

module.exports = router
