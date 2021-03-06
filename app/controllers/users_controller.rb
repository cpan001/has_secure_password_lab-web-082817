class UsersController < ApplicationController

  def index

  end

  def new
    @user = User.new
  end


  def create
    @user = User.new(user_params)
    # byebug
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      redirect_to(controller: "users", action: "new")
    end
  end

  private


  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
