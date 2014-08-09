class MessagesController < ApplicationController

  def new 
    @message = Message.new
    @receiver = params[:receiver]
    respond_to do |format|
      format.js
    end
  end

  def create
    @message = Message.new(message_params)
    @receiver = User.find(params[:receiver])
    @message.send_message(current_user, [@receiver])
    respond_to do |format|
      format.js
    end
  end

  def destroy
  end

  private
  
  def message_params
    params.require(:message).permit(:subject, :body)
  end

end
