class Contact < ActiveRecord::Base

  belongs_to :contactable, polymorphic: true

  validates :contact_type, presence: true
  validates :value, presence: true

end
