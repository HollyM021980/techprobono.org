class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def has_authentication?
    session["#{current_user.id}_has_auth"] rescue false
  end
  helper_method :has_authentication?

  protected

  def provided_authentication(user)
    session["#{user.id}_has_auth"] = true
  end

  def create_session(user)
    session[:user_id] = user.id
  end
end
