class Post < ApplicationRecord
  include UserAuthorizable
  belongs_to :user
  has_many :replies, dependent: :destroy

  belongs_to :tag, optional: true
end
