class AppUser < ApplicationRecord
    # encrypt password
    has_secure_password

    # Model associations
    has_many :users, foreign_key: :app_user_id

    # validation
    validates_presence_of :name, :email_address, :password_digest

    class << self
        def authenticate(email_address, password_digest)
          app_user = AppUser.find_for_authentication(email_address: email_address)
          app_user.try(:valid_password?, password_digest) ? app_user : nil
        end
    end
end
