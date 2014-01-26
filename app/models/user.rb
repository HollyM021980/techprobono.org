class User < ActiveRecord::Base

  module AccountType
    TECHNOLOGIST=0
  end

  has_many :contacts, as: :contactable

end
