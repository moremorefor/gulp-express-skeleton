mongoose = require "mongoose"

# Schema
UserSchema = mongoose.Schema(
  username:
    type: String
    default: ''
  email:
    type: String
    default: ''
  password:
    type: String
    defautl: ''
)

# Validation
UserSchema.path('username').validate ((username) ->
  return username.length
), 'Username required.'

mongoose.model 'User', UserSchema
