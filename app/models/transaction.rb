class Transaction < ApplicationRecord
  # model association
  belongs_to :user

  # validation
  validates_presence_of :total
end
