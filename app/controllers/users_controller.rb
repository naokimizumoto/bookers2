class UsersController < ApplicationController

  def index
   @users = User.all
  end

  def show
    @book = Book.new
    @user = User.find(params[:id])
  end

  def edit
    @user =User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

   private
    def user_params
    params.require(:user).permit(:title, :body, :profile_image)
    end

end