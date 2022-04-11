require 'rails_helper'

RSpec.describe Like, type: :model do
  user_one = User.new
  post_one = Post.new

  it 'test uniqueness of post and author combination' do
    Like.create(author: user_one, post: post_one)
    subject = Like.create(author: user_one, post: post_one)

    expect(subject).to_not be_valid
  end

  it 'testing the update like counter of post on save' do
    post_two = Post.new

    Like.create(author: user_one, post: post_two)

    expect(post_two.likes_counter).to eq 1
  end
end
