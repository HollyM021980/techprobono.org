class Organisation < ActiveRecord::Base
  has_many :contacts, as: :contactable
  accepts_nested_attributes_for :contacts
end
