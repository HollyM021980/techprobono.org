class SessionsController < ApplicationController
  def create
    user = User.find_by_email(params[:login_email])
    if user && user.authenticate(params[:login_password])
      session[:user_id] = user.id
      redirect_to technologist_path(user), :notice => "Logged in!"
    else
      flash.now.alert = "Invalid email or password"
      redirect_to root_url
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
end

