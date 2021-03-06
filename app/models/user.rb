class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'

  alias authenticate valid_password?

  validates :name, presence: true
  validates :encrypted_password, presence: true
  validates :email, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def recent(user)
    Post.where(author_id: user).limit(3).order(created_at: :desc)
  end

  def recent_all(user)
    Post.where(author_id: user).order(created_at: :desc)
  end

  def self.form_token_payload(payload)
    find payload['sub']
  end
end
