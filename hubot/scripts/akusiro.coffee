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
    repeat = 0
    if min?
      msg.send "<@#{user}|#{user}> あくしろ (0/#{count})"
      f = () ->
        msg.send "<@#{user}|#{user}> まだか (#{++repeat}/#{count})"
        if repeat >= count
          clearInterval id
      id = setInterval f, min * 60000
    else
      msg.send "<@#{user}|#{user}> あくしろ"
