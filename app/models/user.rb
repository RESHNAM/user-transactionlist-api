class User < ApplicationRecord
    # model association
    #has_many :transactions, foreign_key: :created_by, dependent: :destroy
    has_many :transactions, foreign_key: :app_user_id, dependent: :destroy
    belongs_to :app_user

  # validations
  validates_presence_of :first_name, :last_name
  validates :email_address, uniqueness: true
  validates :phone_number, uniqueness: true
  validates_format_of :email_address, with: /@/
end
