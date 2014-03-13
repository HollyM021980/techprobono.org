module TechnologistHelper
  def hidden?
    has_authentication? ? "hidden" : ""
  end
end
