class UsersController < ApplicationController
def show
  @users = User.find(params[:id])
  @name = current_user.name
  @messages = current_user.messages
  @categories = Category.all
end

# def edit
# end

# def update
#   if current_user.update(user_params)
#     redirect_to root_path
#   else
#     render :edit
#   end
# end

# private
# def user_params
#   params.require(:user).permit(:name, :email)
# end
end
