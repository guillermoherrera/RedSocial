import consumer from "./consumer"

var post = consumer.subscriptions.create("PostChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
    console.log(this);
    //this.perform("echo",{
    //  hola: "mundo"
    //})
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    console.log(data)
    if(data.action == 'new_post'){
      $("#posts").prepend(data.message)
    }
    // Called when there's incoming data on the websocket for this channel
  },

  //echo(){
    //@perform "echo", {hola: "mundo"}
  //}
});
