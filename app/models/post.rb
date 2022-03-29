
class Post < ApplicationRecord
  belongs_to :author_id, class_name: :user
  has_many :likes
  has_many :comments
end