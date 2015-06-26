# Description
#   なんかそういうデータあるんですか？
# commands
#   hubot hiroyuki {data,kanso,uso} - Receive Hiroyuki

module.exports = (robot) ->
  robot.respond /hiroyuki data/, (msg) ->
    msg.send 'https://pbs.twimg.com/media/CIJr4yDUwAAzjYO.jpg'
  robot.respond /hiroyuki kanso/, (msg) ->
    msg.send 'https://pbs.twimg.com/media/CIJr4x4UsAA74Xc.jpg'
  robot.respond /hiroyuki uso/, (msg) ->
    msg.send 'https://pbs.twimg.com/media/CIJr4xLUYAAF88K.jpg'
