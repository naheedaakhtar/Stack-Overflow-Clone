
FactoryBot.define do
  factory :vote do
    association :user
    votable { association(:post) } # Default to associating with a Post; can override with a Reply
    vote_type { :up }
  end
end
