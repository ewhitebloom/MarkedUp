require 'sidekiq/exception_handler'

class PostsWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  recurrence { hourly }

  def perform
    Post.each do |post|
      if post.votes < 1 && (((post.created_at - Time.now)/(25 * 60 * 60)) > 1)
        post.delete
      end
    end
  end
end
