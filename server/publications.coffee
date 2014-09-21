Meteor.publish "messages", (roomId)->
  if roomId?
    return Messages.find({roomId:roomId})
  else
    return @stop()

Meteor.publish "rooms", ()->
  Rooms.find()
