FactoryGirl.define do

  factory :user do
    sequence(:name){|n| "User#{n}"}
    sequence(:email){|n| "email#{n}@factory.com"}
    professional_headline "Backend Developer"
    account_type User::AccountType::TECHNOLOGIST
    association :contacts, factory: :contact
    password "foo"
    password_confirmation "foo"
  end

  factory :contact do
    contact_type 'github'
    value        'techprobono'
  end

  factory :organisation do
    sequence(:name){|n| "Good Cause#{n}"}
    sequence(:email){|n| "email#{n}@goodcause.com"}

    after(:build) do |organisation|
      organisation.contacts = build_list(:contact, 2, contactable: organisation)
    end

    after(:create) do |organisation|
      organisation.contacts.each { |c| c.save }
    end
  end

end
