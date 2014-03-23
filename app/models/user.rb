require 'bcrypt'

class User < ActiveRecord::Base

  has_secure_password validations: false
  has_many :contacts, as: :contactable
  accepts_nested_attributes_for :contacts
  validates :email, presence: true

  acts_as_taggable_on :skills

  module AccountType
    TECHNOLOGIST=0
  end

end
