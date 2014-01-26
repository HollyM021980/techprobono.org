FactoryGirl.define do

  factory :user do
    sequence :name do
     name "User#{n}"
    end
    sequence :email do |n|
      "email#{n}@factory.com"
    end
    professional_headline "Backend Developer"
    account_type User::AccountType::TECHNOLOGIST
    contacts
  end

  factory :contact do
    contact_type 'github'
    value        'techprobono'
  end

end
