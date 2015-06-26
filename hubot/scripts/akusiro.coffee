# Description
#   あくしろ
# commands
#   hubot akusiro - Says "@imai あくしろ".
#   hubot akusiro <who> - Says "@<who> あくしろ".
#   hubot akusiro <who> every <time>{seconds,minutes,hours,days}[ <count>] - Says "@<who> あくしろ" and "@<who> まだか".

parseTime = (str) ->
  if match = str.match /(\d+(?:\.\d+)?)seconds/
    return 1000 * match[1]
  if match = str.match /(\d+(?:\.\d+)?)minutes/
    return 60000 * match[1]
  if match = str.match /(\d+(?:\.\d+)?)hours/
    return 3600000 * match[1]
  if match = str.match /(\d+(?:\.\d+)?)days/
    return 86400000 * match[1]
  return null


module.exports = (robot) ->
  robot.respond /akusiro(?:(?:\s+)(\S+)(?:(?:\s+)every(?:\s+)(\S+)(?:(?:\s+)(\d+))?)?)?/, (msg) ->
    user = msg.match[1] or 'imai'
    time = parseTime(msg.match[2] or '')
    count = msg.match[3] or 3
    repeat = 0
    if time?
      msg.send "<@#{user}|#{user}> あくしろ (0/#{count})"
      f = () ->
        msg.send "<@#{user}|#{user}> まだか (#{++repeat}/#{count})"
        if repeat >= count
          clearInterval id
      id = setInterval f, time
    else
      msg.send "<@#{user}|#{user}> あくしろ"
