class BroadcastsController < ApplicationController

  def index
    nearby_users = current_user.nearbys(10)
    @broadcasts = Broadcast.where(:broadcaster_id => nearby_users.to_a)
  end

  def create
    broadcast = Broadcast.new(broadcast_params)
    broadcast.broadcaster_id = current_user.id
    if broadcast.save
      respond_to do |format|
        format.js
      end
    else
      raise
    end
  end

  private
  
  def broadcast_params
    params.require(:broadcast).permit(:message)
  end

end
