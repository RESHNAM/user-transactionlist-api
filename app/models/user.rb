class User < ApplicationRecord
    # model association
  has_many :transactions, dependent: :destroy

  # validations
  validates_presence_of :first_name, :last_name
end
