class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  def self.update_post_comments_count(post)
    if post.comments_counter.nil?
      post.comments_counter = 1
    else
      post.comments_counter += 1
    end
  end
end
