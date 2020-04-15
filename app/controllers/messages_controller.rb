class MessagesController < ApplicationController
  before_action :set_current_user

  def index
    @message = Message.new
    @messages = Message.all
    @categories = Category.all
    @messages = Message.includes(:user).order("created_at DESC")
  end

  def new
    @message = Message.new
    @categories = Category.all
  end

  def create
    Message.create(message_params)
    redirect_to root_path
  end

  def destroy
    message = Message.find(params[:id])
    message.destroy
  end

  def edit
    @message = Message.find(params[:id])
    @categories = Category.all
  end

  def update
    message = Message.find(params[:id])
    message.update(message_params)
  end

  def show
    # @messages = Message.all
    @categories = Category.all
    @message = Message.includes(:user).order("user.name DESC")
    @message = Message.find(params[:id])
    @comment = Comment.new
    @comments = @message.comments.includes(:user)
    # @message = Message.includes(:user, :category).order("user.name DESC")
    # # @name = current_user.name
    # # @messages = current_user.messages
    # @categories = Category.all
    # # @messages = Message.all
  end

  private
  def message_params
    params.require(:message).permit(:image, :content, :category_id).merge(user_id: current_user.id)
  end
  
  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end
  
end