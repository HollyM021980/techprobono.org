# Why? Because Rails has form helpers for objects

module HomeHelper

  def technologist
    @technologist = tech_repo.create_empty
    @technologist.contacts.push(contact("twitter", "Twitter name"),
                                contact("github", "Github"),
                                contact("website", "Website / portfolio"))
    @technologist
  end

  private

  def tech_repo
    Repos::Technologist.new
  end

  def contact(type, label_txt)
    Contact.new(contact_type: type, label: label_txt)
  end
end
