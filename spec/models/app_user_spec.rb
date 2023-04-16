require 'rails_helper'

#Test suite for AppUser model
RSpec.describe AppUser, type: :model do
  # Association test
  # ensure User model has a 1:m relationship with the user model
  #it { should have_many(:users) }
  #it { should have_many(:id) }

  # Validation tests
  # ensure name, email and password_digest are present before save
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email_address) }
  it { should validate_presence_of(:password_digest) }
end
