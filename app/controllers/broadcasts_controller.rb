class BroadcastsController < ApplicationController

  def index
    params[:current_user] = current_user
    @broadcasts = BroadcastList.new(params).broadcasts
    @page = params[:page]
    respond_to do |format|
      format.js
    end
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
