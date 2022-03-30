class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  def self.update_post_likes_count(post)
    if post.likes_counter.nil?
      post.likes_counter = 1
    else
      post.likes_counter += 1
    end
  end
end
