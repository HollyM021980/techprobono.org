require 'bcrypt'

class User < ActiveRecord::Base

  has_secure_password validations: false
  has_many :contacts, as: :contactable
  accepts_nested_attributes_for :contacts
  validates :email, presence: true, uniqueness: true

  acts_as_taggable_on :skills

  module AccountType
    TECHNOLOGIST=0
  end

  def twitter_handle
    contact_value("twitter")
  end

  def github
    contact_value("github")
  end

  def contact_value(contact)
    contacts.find_by(contact_type: contact).try(:value)
  end

  def as_json(*args)
    {
      name: name,
      email: email,
      professional_headline: professional_headline,
      contacts: contacts.map do |contact|
        {
          contact_type: contact.contact_type,
          contact_value: contact.value
        }
      end
    }
  end
end