Template.home.rooms = ->
  Rooms.find()

Template.room.events({

  'click #submit': (e,t) ->
    Messages.insert(
      data : t.find("#message").value
      roomId : @_roomId
      )
    t.find("#message").value = ""

  'keydown #message' : ( e,t ) ->
    if e.which is 13
      Messages.insert(
        data : t.find("#message").value
        roomId : @_roomId
      )
      t.find("#message").value = ""

})

clientTime = new Date().valueOf()
timeSkew = 0
latency = 0

new Date().valueOf() - Meteor.call("servertime", (err,data) ->
  latency = new Date().valueOf() - clientTime
  if err
    console.log(err)
  else
    timeSkew = new Date().valueOf() - data
    console.log 'server ', new Date(data)
    console.log 'client ', new Date()
    console.log 'adjust ', new Date(new Date().valueOf() - timeSkew - (latency/2))
)

Template.message.myEmail = (userEmail) ->
  if Meteor.user().emails[0].address is userEmail
    return true
  else
    return false

Template.room.messages = ->
  Messages.find().fetch().sort((a,b)->
    if a.createdAt > b.createdAt
      return 1
    if a.createdAt < b.createdAt
      return -1
    return 0
  ).reverse()

Template.message.rendered = ->
  @$("span").hide().fadeIn(500)

Template.message.fromNow = (timestamp) ->
  if timestamp?
    timestamp = timestamp + timeSkew - (latency/2)
    return moment(new Date(timestamp)).fromNow()
  else
    return moment(new Date()).fromNow()
