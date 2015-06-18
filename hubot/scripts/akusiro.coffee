# Description
#   あくしろ
# commands
#   hubot akusiro - Says "@imai あくしろ".
#   hubot akusiro <who> - Says "@<who> あくしろ".
#   hubot akusiro <who> every <time>min[ <count>] - Says "@<who> あくしろ" and "@<who> まだか".

module.exports = (robot) ->
  robot.respond /akusiro(?:(?:\s+)(\S+)(?:(?:\s+)every(?:\s+)(\d+(?:\.\d+)?)min(?:(?:\s+)(\d+))?)?)?/, (msg) ->
    user = msg.match[1] or 'imai'
    min = msg.match[2]
    count = msg.match[3] or 3
    msg.send "@#{user} あくしろ"
    if min?
      f = () ->
        msg.send "@#{user} まだか"
        if --count <= 0
          clearInterval id
      id = setInterval f, min * 60000
