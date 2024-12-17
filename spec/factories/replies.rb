FactoryBot.define do
    factory :reply do
      text { "Sample reply text" }
      association :post
      association :user
    end
  end
  