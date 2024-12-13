FactoryBot.define do
  factory :user_cred do
    name { "MyString" }
    details { "MyString" }
    school { "MyString" }
    approved { false }
    user { nil }
  end
end
