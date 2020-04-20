class CategoriesController < ApplicationController
  def show
    @categories = Category.all
    categories = Category.find(params[:id])
    @messages = categories.messages
    @name = categories.name
  end
end
