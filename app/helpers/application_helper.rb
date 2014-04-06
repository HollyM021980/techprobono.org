module ApplicationHelper

  def has_authentication?
    current_user.nil? || !current_user.password_digest.nil?
  end

  def current_user?
    current_user.present?
  end
  alias_method :authenticated?, :current_user?

  def authentication_errors?
  	flash.alert.present?
  end
end
