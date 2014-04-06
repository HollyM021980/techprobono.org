module Repos
  class Technologist

    ACCOUNT_TYPE = User::AccountType::TECHNOLOGIST

    def create(params)
      User.create(create_params(params))
    end

    def find(id)
      User.find_by(id: id,
         account_type: ACCOUNT_TYPE)
    end

    def update(user, params)
      user.update_attributes(update_params(params))
      if params[:contacts].present?
        parse_update_contacts(params[:contacts]).each do |contact|
          user.contacts.find_or_create_by(contact_type: contact[:contact_type]).tap do |c|
            c.value = contact[:value]
            c.save
          end
        end
      end
      user
    end

    def create_empty
      User.new(account_type)
    end

    def update_params(params)
      partial_params = create_params(params)
      partial_params.delete(:contacts_attributes)
      partial_params
    end

    def create_params(params)
      {
        contacts_attributes: parse_create_contacts(params),
        professional_headline: params[:professional_headline],
        name: params[:name],
        email: params[:email],
        skill_list: parse_skills(params),
        account_type: ACCOUNT_TYPE,
        password: params[:password],
        password_confirmation: params[:password]
      }.delete_if{ |_, v| v.blank? }
    end

    private

    def parse_update_contacts(contacts)
      contacts.map { |_, v| v }
    end

    def parse_create_contacts(params)
      [:twitter, :github, :portfolio].map do |c|
        next if params[c].blank?
        {
          contact_type: c.to_s,
          value: params[c]
        }
      end.compact
    end

    def parse_skills(params)
      return [] if !params[:skills].present?
      params[:skills].split(",")
    end

    def account_type
      { account_type: ACCOUNT_TYPE }
    end
  end
end
