require 'rails_helper'

RSpec.describe SortPostsByTrendingJob, type: :job do
  include ActiveJob::TestHelper

  after { clear_enqueued_jobs }

  it "enqueues the job" do
    expect {
      Post.trigger_sort_job
    }.to have_enqueued_job(SortPostsByTrendingJob)
  end

  it "prioritizes posts from the past day over posts from previous days" do
    canned_time = Time.new("2024-09-31 01:00:00")
    allow(Time).to receive(:now).and_return(canned_time)
    post1 = FactoryBot.create(:post, created_at: canned_time)
    post2 = FactoryBot.create(:post, created_at: canned_time.yesterday)
    SortPostsByTrendingJob.perform_now
    post1.reload
    post2.reload
    expect(post1.trend_score).to be > post2.trend_score
  end
end
