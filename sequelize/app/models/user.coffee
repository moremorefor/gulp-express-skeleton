'use strict'
Sequelize = require 'sequelize'
crypto    = require 'crypto'

module.exports = (sequelize, DataTypes) ->
  User = sequelize.define(
    'User',
    {
      username:
        type: Sequelize.STRING
        allowNull: false
        validate:
          notEmpty:
            msg: "Username can't be blank"
      email:
        type: Sequelize.STRING
        allowNull: false
        validate:
          notEmpty:
            msg: "Email can't be blank"
          isEmail:
            msg: 'Please enter a valid email address'
      hashed_password:
        type: Sequelize.STRING
        allowNull: false
      salt:
        type: Sequelize.STRING
        allowNull: false

      password:
        type: DataTypes.VIRTUAL
        set:  (val) ->
          this.setDataValue 'password', val
          salt = this.makeSalt()
          this.setDataValue 'salt', salt
          hashed_password = this.encryptPassword val
          this.setDataValue 'hashed_password', hashed_password
        validate:
          notEmpty:
            msg: "Password can't be blank"
    },
    {
      classMethods:
        associate: (models) ->
          # associations can be defined here
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
