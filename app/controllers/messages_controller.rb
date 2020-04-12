class MessagesController < ApplicationController
  before_action :set_current_user

  def index
    @message = Message.new
    @messages = Message.all
  end

  def new
    @message = Message.new
    @categories = Category.all
  end

  def create
    Message.create(message_params)
    redirect_to root_path
  end

  private
  def message_params
    params.require(:message).permit(:image, :content, :category_id).merge(user_id: current_user.id)
  end
  
  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end
  
end