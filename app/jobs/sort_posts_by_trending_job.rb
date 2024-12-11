class SortPostsByTrendingJob < ApplicationJob
  queue_as :default
  
  DECAY = 0.8
  def perform(*args)
    Post.find_each do |post|
      age_in_hours = (Time.now - post.created_at) / 3600
      popularity = ([post.votes, 10].max * 2) + post.replies.count
      recency = Math.exp(-DECAY * Math.sqrt(age_in_hours))
      post.trend_score = popularity * recency
      post.save!
    end
  end
end
