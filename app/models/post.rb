class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes, foreign_key: 'post_id'
  has_many :comments, foreign_key: 'post_id'

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_save :update_user_post_count

  def recent_comments(post)
    Comment.where(post_id: post).limit(5).order(created_at: :desc)
  end

  def recent_comments_all(post)
    Comment.where(post_id: post).order(created_at: :desc)
  end

  private

  def update_user_post_count
    author.increment!(:posts_counter)
  end
end
