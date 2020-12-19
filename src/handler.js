"use strict"

module.exports = (event, context) => {
  const result = {
    'status': 'Hey there!'
  }

  return context
    .status(200)
    .headers({
      "Content-Type": "text/plain"
    })
   .succeed(result)
}