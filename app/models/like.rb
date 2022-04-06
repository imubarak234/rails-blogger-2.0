class Like < ApplicationRecord
  validates :author_id, uniqueness: { scope: :post_id }
  
  
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_save :update_post_likes_count

  private

  def update_post_likes_count
    post.increment!(:likes_counter)
  end
  
end
