class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books.all
    @new_book = @user.books.new
  end
  
  def index
    @user = User.find(current_user.id)
    @users = User.all
    @new_book = @user.books.new
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to books_path
    else
      render :edit
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  
end
