require 'rails_helper'

RSpec.describe Comment, type: :model do

  it 'Testing the update comment counter of referenced post' do

    user_04 = User.new
    post_04 = Post.new

    Comment.create(post: post_04, author: user_04, text: 'tests should work from here')

    expect(post_04.comments_counter).to eq 1
  end
end