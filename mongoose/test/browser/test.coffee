if typeof require == 'function' and typeof module == 'object'
  assert = require('power-assert')
else
  assert = window.assert

describe 'Sample Test', ->
    it 'Test 1', ->
        assert 1 + 1, 2

    it 'Test 2', ->
        assert.notEqual 1 + 1, 3
