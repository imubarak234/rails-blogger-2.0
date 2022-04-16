RSpec.describe 'Post Show', type: :feature do
  describe 'Post Show page functions' do
    it 'Check for CRUD features' do
      user = User.create(id: 1, name: 'tester', photo: 'photo.com', bio: 'All days', email: 'example@email.com',
                         password: '123456789')
      one = Post.create(author: user, title: 'Hello1', text: 'This is my first post1')
      Comment.create(post: one, author: user, text: 'Hi Tom!')

      visit "users/#{user.id}/posts/#{one.id}"

      expect(page).to have_content(one.title.to_s)
      expect(page).to have_content(user.name.to_s)
      expect(page).to have_content("Comments: #{one.comments_counter}")
      expect(page).to have_content("Likes: #{one.likes_counter}")
      expect(page).to have_content(one.text.to_s)
      # expect(page).to have_content("#{user.name}", count: User.count)

      Comment.all.each do |n|
        expect(page).to have_content(n.author.name.to_s)
        expect(page).to have_content(n.text.to_s)
      end
    end
  end
end
