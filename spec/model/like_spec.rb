require 'rails_helper'

RSpec.describe Like, type: :model do

  user_01 = User.new
  post_01 = Post.new

  it 'test uniqueness of post and author combination' do
    subject = Like.create(author: user_01, post: post_01)
    subject = Like.create(author: user_01, post: post_01)

    expect(subject).to_not be_valid
  end

  it 'testing the update like counter of post on save' do

    post_02 = Post.new

    subject = Like.create(author: user_01, post: post_02)

    expect(post_02.likes_counter).to eq 1
  end
end