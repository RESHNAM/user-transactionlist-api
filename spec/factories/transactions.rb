FactoryBot.define do
    factory :transaction do
      credit { Faker::Number.decimal(l_digits: 2) }
      debit { Faker::Number.decimal(l_digits: 2) }
      total { Faker::Number.decimal(l_digits: 2) }
      user_id nil
    end
  end