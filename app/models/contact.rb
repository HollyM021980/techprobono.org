class Contact < ActiveRecord::Base

  belongs_to :contactable, polymorphic: true

  validates :contact_type, presence: true
  validates :value, presence: true

  scope :contact_value_for, -> (contacttype) { find_by(contact_type: contacttype).try(:value) }
end
