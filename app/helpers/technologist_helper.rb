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

  def tech_name
    tech.twitter_handle ||
    tech.github ||
    tech.email
  end

  private

  def repo
    Repos::Technologist.new
  end
end
