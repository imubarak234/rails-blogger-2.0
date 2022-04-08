class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'

  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def recent(user)
    Post.where(author_id: user).limit(3).order(created_at: :desc)
  end

  def recent_all(user)
    Post.where(author_id: user).order(created_at: :desc)
  end

  def info(ids)
    User.find_by(id: ids)
  end

  def print
    User.all.limit(5)
  end
end
