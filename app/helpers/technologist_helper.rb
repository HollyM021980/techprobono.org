module TechnologistHelper
  def hidden?
    has_authentication? ? "hidden" : ""
  end

  def tech
    Repos::Technologist.find(params[:id])
  end
end
