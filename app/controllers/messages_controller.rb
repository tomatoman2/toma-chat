class MessagesController < ApplicationController
  def index
    @message = Message.all
  end
  
  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    redirect_to root_path
  end

  private

  def message_params
    params.require(:message).permit(:image, :content).merge(user_id: current_user.id)
  end
end
