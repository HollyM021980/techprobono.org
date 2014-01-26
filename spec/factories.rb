FactoryGirl.define do

  factory :user do
    sequence(:name){|n| "User#{n}"}
    sequence(:email){|n| "email#{n}@factory.com"}
    professional_headline "Backend Developer"
    account_type User::AccountType::TECHNOLOGIST
    association :contacts
  end

  factory :contact do
    contact_type 'github'
    value        'techprobono'
  end

end
