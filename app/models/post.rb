class Post < ApplicationRecord
  include UserAuthorizable
  belongs_to :user
  has_many :replies, dependent: :destroy

  has_and_belongs_to_many :tags, optional: true

  def self.trigger_sort_job
    SortPostsByTrendingJob.perform_later
  end



  def get_tags
    full_tags = []
    full_tags = full_tags + self.tags
    instructor_response = false
    self.replies.each { |reply| instructor_response = true if reply.user.approved?}
    full_tags = full_tags << Tag.approved if instructor_response
    full_tags
  end

end
