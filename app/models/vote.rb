class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :votable, polymorphic: true

  enum vote_type: { down: 0, up: 1 }

  validates :vote_type, presence: true
  validates :votable_type, inclusion: { in: %w[Post Reply] }

  scope :up, -> { where(vote_type: :up) }
  scope :down, -> { where(vote_type: :down) }
end
