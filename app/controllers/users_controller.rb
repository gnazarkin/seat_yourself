class UsersController < ApplicationController

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  end

  def update
  	@user = User.find(params[:id])
  end

  def show
  	@user = User.find(params[:id])
  end

  private
  def user_params
  	params.equire(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
end
