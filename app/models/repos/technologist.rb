module Repos
  class Technologist

    ACCOUNT_TYPE = User::AccountType::TECHNOLOGIST

    def create(params)
      User.create(parse_params(params))
    end

    def find(id)
      User.find_by(id: id,
         account_type: ACCOUNT_TYPE)
    end

    def update(user, params)
      user.update_attributes(parse_params(params))
    end

    def create_empty
      User.new(account_type)
    end

    def parse_params(params)
      password = params[:password] || SecureRandom.hex(10)
      {
        contacts_attributes: parse_contacts(params),
        email: params[:email],
        skill_list: parse_skills(params),
        account_type: ACCOUNT_TYPE,
        password: password,
        password_confirmation: password
      }.delete_if{ |_, v| v.blank? }
    end

    private

    def parse_contacts(params)
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
