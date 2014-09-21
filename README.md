Echo Server
===========

A simple chat server that allows users to create their own rooms.

This project uses coffeescript as its premier language.
It also uses stylus for css (which yu can think of as css without the {, }, :, and ;).

Also, it uses bootstrap 3 as its css framework.



Database
========

There are two data collections so far that this project uses:

1.  Rooms ('db.rooms')

2.  Messages ('db.messages')


Example data:

    rooms     = { '_id' : "AE7FKNkwdwc7iD8tx" }
    messages  = { "data" : "this is a message", "roomId" : "AE7FKNkwdwc7iD8tx", "createdAt" : 1411256250723, "user" : "jim@jim.com", "_id" : "G7igjMZSdHLjHXS4H" }

