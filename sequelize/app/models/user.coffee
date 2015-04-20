'use strict'
Sequelize = require 'sequelize'
crypto    = require 'crypto'

module.exports = (sequelize, DataTypes) ->
  User = sequelize.define(
    'User',
    {
      username:
        type: Sequelize.STRING
      email:
        type: Sequelize.STRING
      hashed_password:
        type: Sequelize.STRING
      salt:
        type: Sequelize.STRING

      password:
        type: DataTypes.VIRTUAL
        set:  (val) ->
          this.setDataValue 'password', val
          salt = this.makeSalt()
          this.setDataValue 'salt', salt
          hashed_password = this.encryptPassword val
          this.setDataValue 'hashed_password', hashed_password
        validate:
          isNotBlank: (val)->
            if val.length == 0
              throw new Error 'Password cannot be blank'
    },
    {
      classMethods:
        associate: (models) ->
          # associations can be defined here
          # User.hasMany models.Task
          return
      instanceMethods:
        authenticate: (password) ->
          this.encryptPassword(password) == this.hashed_password

        makeSalt: ->
          Math.round( new Date().valueOf() * Math.random()  ).toString()

        encryptPassword: (password) ->
          if !password
            return ''
          try
            return crypto
              .createHmac 'sha256', this.salt
              .update password
              .digest 'hex'
          catch err
            return ''
          return
    }
  )
  User
