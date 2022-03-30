class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes, foreign_key: 'post_id'
  has_many :comments, foreign_key: 'post_id'

  attr_accessor :comments_counter, :likes_counter

  after_save :update_user_post_count

  def self.recent_comments(post)
    Comment.where(post:).limit(5).order(created_at: :desc)
  end

  private

  def update_user_post_count
    if author.posts_counter == nil
      author.posts_counter = 1
    else
      author.increment!(:posts_counter)
    end
  end

  
end
