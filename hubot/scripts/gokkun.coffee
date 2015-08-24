# Description
#  それゴックンした？

module.exports = (robot) ->
  robot.hear /.+/i, (res) ->
    if Math.random() < 0.01
      res.reply 'それゴックンした？'
