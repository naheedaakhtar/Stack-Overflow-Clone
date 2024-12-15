FactoryBot.define do
  factory :post do
    title { "MyString" }
    text { "MyString" }
    association :user
  end
end
