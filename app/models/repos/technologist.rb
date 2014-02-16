module Repos
  class Technologist

    ACCOUNT_TYPE = User::AccountType::TECHNOLOGIST

    def create(params)
      User.create(params.merge(account_type))
    end

    def find(id)
      User.find_by(id: id,
         account_type: ACCOUNT_TYPE)
    end

    def create_empty
      User.new(account_type)
    end

    private

    def account_type
      { account_type: ACCOUNT_TYPE }
    end

  end
end
