FactoryBot.define do
  factory :user do
    username { 'user' }
    password { 'password' }
    firstname { 'User' }
    lastname { 'Name' }
    email { 'user@colgate.edu' }
    role { 'student' }
  end
end
