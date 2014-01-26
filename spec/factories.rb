FactoryGirl.define do

  factory :user do
    sequence(:name){|n| "User#{n}"}
    sequence(:email){|n| "email#{n}@factory.com"}
    professional_headline "Backend Developer"
    account_type User::AccountType::TECHNOLOGIST
    association :contacts, factory: :contact
  end

  factory :contact do
    contact_type 'github'
    value        'techprobono'
  end

  factory :organisation do
    sequence(:name){|n| "Good Cause#{n}"}
    sequence(:email){|n| "email#{n}@goodcause.com"}
    association :contacts, factory: :contact
  end

end
