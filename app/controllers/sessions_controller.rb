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
    id = session[:user_id]
    session[:user_id] = nil
    redirect_to technologist_path(find_user(id)), :notice => "Logged out!"
  end

  private

  def find_user(id)
    User.find(id)
  end
end

