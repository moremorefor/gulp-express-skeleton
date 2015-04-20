
request = require 'supertest'
app = require '../../server.coffee'
req = request app
assert = require 'power-assert'

describe 'Test GET /', ->
  it 'should return 200', (done) ->
    req.get '/'
      .expect 200, done
