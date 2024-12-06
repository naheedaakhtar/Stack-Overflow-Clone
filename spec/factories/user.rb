FactoryBot.define do
  factory :user do
    sequence(:username) { |n| "user#{n}" }
    password { 'password' }
    firstname { 'User' }
    lastname { 'Name' }
    sequence(:email) { |n| "user#{n}@example.com" }
    role { 'student' }
  end
end
