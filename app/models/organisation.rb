class Organisation < ActiveRecord::Base

  has_many :contacts, as: :contactable
  accepts_nested_attributes_for :contacts

  validates :name, presence: true
  validates :email, presence: true

end
