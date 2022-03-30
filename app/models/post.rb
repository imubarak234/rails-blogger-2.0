class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes, foreign_key: 'post_id'
  has_many :comments, foreign_key: 'post_id'

  def self.update_user_post_count(user)
    if user.posts_counter.nil?
      user.posts_counter = 1
    else
      user.posts_counter += 1
    end
  end

  def self.recent_comments(post)
    Comment.where(post:).limit(5).order(created_at: :desc)
  end

  attr_accessor :title, :text, :comments_counter, :likes_counter
end
