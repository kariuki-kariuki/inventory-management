class AssetsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "assets"
  end

  # def receive(data)
  #   ActionCable.server.broadcast("assets", data)
  # end
    
  

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
