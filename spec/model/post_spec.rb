require 'rails_helper'

RSpec.describe User, type: :model do
  first_user = User.new
  subject { Post.create(author: first_user, title: 'Hello', text: 'This is my first post') }

  it 'title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'title should be a max of 250 characters' do
    subject.title = 'a' * 251
    expect(subject).to_not be_valid
  end

  it 'comment counter should be integer' do
    subject.comments_counter = 2.2
    expect(subject).to_not be_valid
  end

  it 'likes counter should be integer' do
    subject.likes_counter = 2.2
    expect(subject).to_not be_valid
  end

  it 'comments count should be greater than or equals to zero' do
    subject.comments_counter = -1
    expect(subject).to_not be_valid
  end

  it 'likes count should be greater than or equals to zero' do
    subject.likes_counter = -1
    expect(subject).to_not be_valid
  end

  context 'Testing methods in the post model' do

    first_post = Post.create(author: fifth_user, title: 'Hello', text: 'This is my first post')

    Comment.create(post: first_post, author: fifth_user, text: 'Hi Tom!')
    Comment.create(post: first_post, author: fifth_user, text: 'Hi Tom!')
    Comment.create(post: first_post, author: fifth_user, text: 'Hi Tom!')
    Comment.create(post: first_post, author: fifth_user, text: 'Hi Tom!')
    Comment.create(post: first_post, author: fifth_user, text: 'Hi Tom!')
    Comment.create(post: first_post, author: fifth_user, text: 'Hi Tom!')

    it 'test for the comment method that list the most recent 5 comments' do
      comments_all = Post.new.recent_comments(first_post)

      expect(comments_all.count).to eq 5
    end

    it 'test for the comment method that list all comments' do
      comments_all = Post.new.recent_comments_all(first_post)

      expect(comments_all.count).to be > 5
    end

    it 'test for increment Author post count' do
      expect(fifth_user.posts_counter).to eq 1
    end
  end
end
