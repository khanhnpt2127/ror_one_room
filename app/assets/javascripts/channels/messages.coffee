console.log("setting up messages channel", App.cable)

App.messages = App.cable.subscriptions.create "MessagesChannel",
  connected: ->
    # Called when the subscription is ready for use on the server
    console.log("connected")
  disconnected: ->
    # Called when the subscription has been terminated by the server
    console.log("Disconnected")


  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    console.log("Data received" :data)
    $(".messages").append(data.message)


  test: (data) ->
    @perform 'test', message: data
