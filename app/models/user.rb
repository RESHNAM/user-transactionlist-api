class User < ApplicationRecord
    # model association
  has_many :transactions, dependent: :destroy

  # validations
  validates_presence_of :phone_number, :email_address
end
