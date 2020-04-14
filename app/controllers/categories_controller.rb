class CategoriesController < ApplicationController
  def show
    @categories = Category.all
    categories = Category.find(params[:id])
    @messages = categories.messages
    @name = categories.name
    # @messages = Category.message
    # @categories = Category.where(params[:id])
    # @name = Categty.name
    # @messages = current_user.messages
    # @messages = @category.messages.order(created_at: :desc).all
    # if params[:category_id]
    #   # Categoryのデータベースのテーブルから一致するidを取得
    #   @category = Category.find(params[:category_id])
    #   # category_idと紐づく投稿を取得
    #   @messages = @category.messages.order(created_at: :desc).all
    # else
    #   # 投稿すべてを取得
    #   @messages = Message.order(created_at: :desc).all
    # end
  end
end
