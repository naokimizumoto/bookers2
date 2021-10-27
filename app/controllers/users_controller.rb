class UsersController < ApplicationController

  def index
   @users = User.all
   @user =current_user
  end

  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user =User.find(params[:id])
    if @user.user ==current_user
      render :edit
    else
      redirect_to users_path
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    redirect_to user_path(@user.id),  notice: "You have updated user successfully"
    else
      render :edit
    end
  end

   private
    def user_params
    params.require(:user).permit(:title, :body, :profile_image)
    end

end
