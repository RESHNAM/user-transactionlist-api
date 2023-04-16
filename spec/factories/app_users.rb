FactoryBot.define do
  factory :app_user do
    name { Faker::Name.name }
    email_address { "foo@bar.com" }
    password_digest { "MyString" }
  end
end
