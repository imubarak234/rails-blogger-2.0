require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'post count should be greater than or equals to zero' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end

  it 'post count should be integer' do
    subject.posts_counter = 2.2
    expect(subject).to_not be_valid
  end

  context 'Testing methods in the user model' do
    first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')

    Post.create(author: first_user, title: 'Hello', text: 'This is my first post')
    Post.create(author: first_user, title: 'Hello', text: 'This is my first post')
    Post.create(author: first_user, title: 'Hello', text: 'This is my first post')
    Post.create(author: first_user, title: 'Hello', text: 'This is my first post')

    it 'test the 3 most recent post method' do
      posts_all = User.new.recent(first_user)

      expect(posts_all.count).to eq 3
    end

    it 'test the recent_all method in the user model' do
      posts_all = User.new.recent_all(first_user)

      expect(posts_all.count).to be > 3
    end
  end
end
