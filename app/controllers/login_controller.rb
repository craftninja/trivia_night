class LoginController < ApplicationController

  def destroy
    @current_user = session[:current_user_id] = nil
    redirect_to root_path
  end

  def new
    @user = User.new
  end

  def create
    if user = User.find_by(:username => params[:user][:username]).try(:authenticate, params[:user][:password])
      session[:current_user_id] = user.id
      redirect_to root_url
    end
  end

end
