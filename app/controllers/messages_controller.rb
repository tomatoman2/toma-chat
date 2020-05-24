class MessagesController < ApplicationController
  before_action :set_current_user
  before_action :authenticate_user,{only: [:new,:create,:edit,:update]}
  before_action :set_message,{only: [:destroy,:edit,:update]}

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
    if @message.user_id = current_user.id && @message.destroy
      render 'messages/destroy'
    else
      redirect_to root_path
    end
  end

  def edit
    @categories = Category.all
  end

  def update
    @message.update(message_params)
  end

  def show
    @categories = Category.all
    @message = Message.includes(:user).order("user.name DESC")
    @message = Message.find(params[:id])
    @comment = Comment.new
    @comments = @message.comments.includes(:user)
    @like = Like.new
    @name = User.find(@message[:user_id])
  end

  private
  def message_params
    params.require(:message).permit(:image, :content, :category_id).merge(user_id: current_user.id)
  end

  def set_message
    @message = Message.find(params[:id])
  end
  
  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end
  
  def authenticate_user
    if !user_signed_in?
      redirect_to new_user_session_path
    end
  end
  
end