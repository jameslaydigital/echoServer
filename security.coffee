Messages.allow(
  insert : (userId, doc) ->
    doc.createdAt = new Date().valueOf()
    doc.user = Meteor.users.findOne(userId).emails.pop().address
    true

  update : (userId, doc, fieldNames, modifier) ->
    true

  remove : (userId, doc) ->
    true
)

Rooms.allow(
  insert : (userId, doc) ->
    true

  update : (userId, doc, fieldNames, modifier) ->
    true

  remove : (userId, doc) ->
    true
)
