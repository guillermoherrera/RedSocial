class PostChannel < ApplicationCable::Channel
  def subscribed
    stream_from "posts_#{current_user.id}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  #def echo(data)
  #  ActionCable.server.broadcast "demo", data
  #end
end
