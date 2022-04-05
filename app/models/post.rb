class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes, foreign_key: 'post_id'
  has_many :comments, foreign_key: 'post_id'

  after_save :update_user_post_count

  def recent_comments(post)
    Comment.where(post_id: post).limit(5).order(created_at: :desc)
  end

  def recent_comments_all(post)
    Comment.where(post_id: post).order(created_at: :desc)
  end

  def print
    Post.all.limit(5)
  end

  def info(ids)
    Post.find_by(id: ids)
  end

  def update_id(ids, idx)
    var = Post.find_by(id: ids)
    var.update(id: idx)
  end

  def increment_like
    self.increment!(:likes_counter)
  end

  private

  def update_user_post_count
    author.increment!(:posts_counter)
  end
end
