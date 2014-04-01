module TechnologistHelper
  def hidden?
    has_authentication? ? "hidden" : ""
  end

  def tech
    repo.find(params[:id])
  end

  def tech_professional_headline
    tech.professional_headline || "+ professional headline"
  end

  def add_more
    "addmore" if tech.professional_headline.nil?
  end


  def current_user_name
    current_user? ? user_name(current_user) :
                    ""
  end

  def tech_name
    user_name(tech)
  end

  def user_name(user)
    user.twitter_handle ||
    user.github ||
    user.email
  end

  private

  def repo
    Repos::Technologist.new
  end
end
