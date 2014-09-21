

Router.configure
  layoutTemplate : 'layout'
  loadingTemplate : 'loading'
  notFoundTemplate : 'notFound'

  load : ->
    $('html, body').animate({ scrollTop: 0}, 400)
    $("#content").hide().fadeIn(500)

Router.map ->
  @route "home",
    path : '/'

  @route "newRoom",
    path : '/rooms'
    onBeforeAction : (pause) ->
      pause()
      if not Meteor.user()? and not Meteor.loggingIn()
        alert "Please log in first."
        Router.go 'home'
        return false

      newRoomId = Rooms.insert({})
      Router.go("room", {_roomId : newRoomId})

  @route "room",
    path : '/room/:_roomId'
    data : ->
      Session.set "_roomId", @params._roomId
      _roomId : @params._roomId

    onBeforeAction : (pause) ->
      if not Meteor.user()? and not Meteor.loggingIn()
        pause()
        alert "Please log in first."
        Router.go 'home'

  return

