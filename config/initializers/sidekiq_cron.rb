require 'sidekiq/cron/job'

if ARGV.any? { |arg| arg.start_with?('db:') }
  Rails.logger.info("Skipping Sidekiq::Cron::Job setup during database tasks")
  return
end

begin
  redis = Redis.new(url: ENV.fetch('REDIS_URL', 'redis://127.0.0.1:6379/0'))
  redis.ping # Test the Redis connection
rescue Redis::CannotConnectError
  Rails.logger.warn("Redis is not available. Skipping Sidekiq::Cron::Job setup.")
  return
end

Sidekiq::Cron::Job.create(
  name: 'SortPostsByTrendingJob - every minute',
  cron: '* * * * *',
  class: 'SortPostsByTrendingJob'
)