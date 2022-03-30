class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_save :update_post_comments_count

  private

  def update_post_comments_count
    if post.comments_counter.nil?
      post.comments_counter = 1
    else
      post.increment!(:comments_counter)
    end
  end
end
