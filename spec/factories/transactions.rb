FactoryBot.define do
    factory :transaction do
      credit { Faker::StarWars.character }
      dedit { Faker::StarWars.character }
      done false
      reference nil
    end
  end