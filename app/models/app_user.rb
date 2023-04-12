class AppUser < ApplicationRecord
    # encrypt password
    has_secure_password

    # Model associations
    has_many :users
end
