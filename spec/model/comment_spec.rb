require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'Testing the update comment counter of referenced post' do
    user_four = User.new
    post_four = Post.new

    Comment.create(post: post_four, author: user_four, text: 'tests should work from here')

    expect(post_four.comments_counter).to eq 1
  end
end
