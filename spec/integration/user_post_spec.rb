RSpec.describe 'User Post', type: :feature do
  describe 'User_Post Index page functions' do
    it 'Check for CRUD features' do
      user = User.create(id: 1, name: 'tester', photo: 'photo.com', bio: 'All days', email: 'example@email.com',
                         password: '123456789')
      one = Post.create(author: user, title: 'Hello1', text: 'This is my first post1')
      Post.create(author: user, title: 'Hello2', text: 'This is my first post')
      Post.create(author: user, title: 'Hello3', text: 'This is my first post')
      Post.create(author: user, title: 'Hello4', text: 'This is my first post')

      Comment.create(post: one, author: user, text: 'Hi Tom!')

      visit "users/#{user.id}/posts"

      expect(page).to have_content(user.name.to_s)
      expect(page).to have_content('Picture')
      expect(page).to have_content("Number of posts: #{user.posts_counter}")
      expect(page).to have_content(one.title.to_s)
      expect(page).to have_content(one.text.to_s)
      expect(page).to have_content("Likes: #{one.likes_counter}")
      expect(page).to have_content(Comment.first.text.to_s)
      expect(page).to have_content("Comments: #{one.comments_counter}")
      expect(page).to have_content('Pagination')

      click_on 'Post Page# 1'

      expect(page).to have_current_path("/users/#{user.id}/posts/3")
    end
  end
end
