development = require "./env/development"
production  = require "./env/production"

module.exports = {
  development: development
  production: production
}[process.env.NODE_ENV || "development"]
