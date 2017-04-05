class UsersController < ApplicationController
  include SimpleSearch

  def index
    searching
    @user = current_user
    @friendships = current_user.friendships
  end

  def show
    @user = User.find(params[:id])
    @songs = @user.songs
    @friendships = @user.friendships
    @inverse_friendships = @user.inverse_friendships
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(user_params)
    redirect_to user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:email, :avatar, :first_name, :last_name)
  end
end
