require 'rails_helper'

RSpec.describe Transaction, type: :model do
  # Association test
  # ensure an transaction record belongs to a single user record
  it { should belong_to(:user) }
  # Validation test
  # ensure column name is present before saving
  it { should validate_presence_of(:total) }
end
