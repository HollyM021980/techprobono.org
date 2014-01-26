module Repos
  class Technologist

    def create(params)
      User.create(params.merge(account_type))
    end

    private

    def account_type
      { account_type: User::AccountType::TECHNOLOGIST }
    end

  end
end
