class AppUser < ApplicationRecord
    # encrypt password
    has_secure_password

    # Model associations
    has_many :users, foreign_key: :app_user_id

    # validation
    validates_presence_of :name, :email_address, :password_digest
end
