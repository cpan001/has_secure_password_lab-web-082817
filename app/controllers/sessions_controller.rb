class SessionsController < ApplicationController

  def new

  end

  def create
    # byebug
    @user = User.find_by(name: params[:user][:name])
    if !@user.nil? && !params[:user][:password].nil? && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      redirect_to(controller: "sessions", action: "new")
    end

  end
end
