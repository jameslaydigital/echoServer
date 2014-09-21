Meteor.subscribe "rooms"

Meteor.subscribe "messages"
Tracker.autorun( ->
  Meteor.subscribe "messages", Session.get("_roomId")
)
