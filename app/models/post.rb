class Post < ApplicationRecord
  include UserAuthorizable
  belongs_to :user
  has_many :replies, dependent: :destroy

  has_and_belongs_to_many :tags, optional: true

  def self.trigger_sort_job
    SortPostsByTrendingJob.perform_later
  end
end
