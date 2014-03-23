module ApplicationHelper

  def has_authentication?
    current_user.nil? || !current_user.password_digest.nil?
  end
end
