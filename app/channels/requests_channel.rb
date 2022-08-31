class RequestsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "requests"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def receive(data)
    request = Request.find(data["id"])
    ActionCable.server.broadcast("requests",data)
  end
end
