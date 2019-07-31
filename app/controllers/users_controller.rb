class UsersController < ApplicationController
      before_action :authenticate_user!
      before_action :correct_user, only: :edit

  def show
  	@bookn = Book.new
  	@user = User.find(params[:id])
  	@bookm = @user.books
    @userk = current_user
  end

  def edit
  	@user = User.find(params[:id])
  end

  def index
  	@bookn = Book.new
  	@usern = User.all
    @user = current_user
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

private
  def user_params
      params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def correct_user
      @user = User.find(params[:id])
      if @user != current_user
        redirect_to user_path(current_user)
      end
    end
end
