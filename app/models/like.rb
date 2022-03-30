class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_save :update_post_likes_count

  private

  def update_post_likes_count
    if post.likes_counter == nil
      post.likes_counter = 1
    else
      post.increment!(:likes_counter)
    end
  end
end

