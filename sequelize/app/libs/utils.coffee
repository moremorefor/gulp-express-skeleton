exports.setFlashErrors = (req, errors)->
  keys = Object.keys errors
  errs = []

  if !keys
    errs.push 'Error: Something wrong'

  keys.forEach (key) ->
    if errors[key]
      errs.push errors[key].message

  for err in errs
    req.flash 'error', err
