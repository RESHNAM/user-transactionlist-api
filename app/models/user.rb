class User < ApplicationRecord
    # model association
    has_many :transactions, dependent: :destroy, foreign_key: :created_by
    belongs_to :app_user

  # validations
  validates_presence_of :first_name, :last_name
  validates :email_address, uniqueness: true
  validates :phone_number, uniqueness: true
  validates_format_of :email, with: /@/
end
