class LikesController < ApplicationController
  before_action :set_message, only: [:create, :destroy]
  def create
    @like = current_user.likes.create(message_id: params[:message_id])
    redirect_to message_path(@message)
  end

  def destroy
    @like = Like.find_by(message_id: params[:message_id], user_id: current_user.id)
    @like.destroy
    redirect_to message_path(@message)
  end

  private
  def set_message
    @message = Message.find(params[:message_id])
  end
end
