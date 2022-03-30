class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'

  def self.recent(user)
    Post.where(author: user).limit(3).order(created_at: :desc)
  end

  attr_accessor :posts_counter
end
