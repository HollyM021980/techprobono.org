class User < ActiveRecord::Base

  acts_as_taggable_on :skills

  module AccountType
    TECHNOLOGIST=0
  end

  has_many :contacts, as: :contactable
  accepts_nested_attributes_for :contacts
  validates :email, presence: true

end
