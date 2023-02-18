class UsersController < ApplicationController
  before_action :currect_user, only: [:edit, :update]
  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end

  def edit
    @user= User.find(params[:id])

  end

  def index
    @user = User.all
    @book = Book.new
  end

  def update
     @user = User.find(params[:id])
     if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
     else
      render :edit
     end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to '/users'
  end

  private

  def user_params
   params.require(:user).permit(:image,:name,:introduction)
  end

  def currect_user
    @user = User.find(params[:id])
    redirect_to(current_user) unless @user == current_user
  end

end
