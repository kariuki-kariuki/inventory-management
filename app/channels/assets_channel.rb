class AssetsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "assets"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
