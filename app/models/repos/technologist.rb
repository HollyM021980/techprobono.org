module Repos
  class Technologist

    ACCOUNT_TYPE = User::AccountType::TECHNOLOGIST

    def create(params)
      User.create(create_data(params))
    end

    def find(id)
      User.find_by(id: id,
         account_type: ACCOUNT_TYPE)
    end

    def create_empty
      User.new(account_type)
    end

    private

    def create_data(params)
      data = params.merge(account_type)
      data.delete(:skills) if !data[:skills].present?
      if params[:contacts_attributes].present?
        data[:contacts_attributes] = params[:contacts_attributes].map{ |_, v| v }
      end
      data
    end

    def account_type
      { account_type: ACCOUNT_TYPE }
    end

  end
end
