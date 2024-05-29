FactoryBot.define do
  sequence :email do |n|
    "user#{n}@test.com"
  end

  factory :user do
    first_name { 'Test' }
    last_name { 'Test' }
    email
    password { '12345678' }
    password_confirmation { '12345678' }
    confirmed_at { Time.now }

    after(:create, &:confirm)
  end
  factory :admin do
    first_name { 'Admin' }
    last_name { 'Test' }
    email { 'admin@test.com' }
    password { '12345678' }
    password_confirmation { '12345678' }
    confirmed_at { Time.now }

    after(:create, &:confirm)
  end
end
