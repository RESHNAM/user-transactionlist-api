FactoryBot.define do
  factory :app_user do
    name { Faker::Name.name }
    email { "foo@bar.com" }
    password_digest { "MyString" }
  end
end
