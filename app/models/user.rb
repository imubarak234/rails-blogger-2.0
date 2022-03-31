class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'

  def recent(user)
    Post.where(author_id: user).limit(3).order(created_at: :desc)
  end

  def recent_all(user)
    Post.where(author_id: user).order(created_at: :desc)
  end

  def info(id)
    User.find_by(id: id)
  end

  def print
    User.all.limit(5)
  end

  attr_accessor :posts_counter
end
