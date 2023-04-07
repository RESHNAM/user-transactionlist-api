FactoryBot.define do
    factory :user do
      #first_name { Faker::Lorem.word }
      #last_name { Faker::Ipsum.word }
      first_name { Faker::Name.unique.first_name }
      last_name { Faker::Name.unique.last_name }
      #phone_number { Faker::Number.unique.number }
      phone_number { Faker::Base.numerify('############') }
      #email_address { Faker::LoremIpsum.word }
      email_address { |n| "user#{n}@gmail.com"  }
    end
  end