RSpec.describe 'User Show', type: :feature do
  
  describe 'User_Show page functions' do
    it 'Check for CRUD features' do
      user = User.create(id: 1,name: "tester", photo: "photo.com", bio: "All days", email: "example@email.com",
        password: "123456789")
      one = Post.create(author: user, title: 'Hello', text: 'This is my first post')
      Post.create(author: user, title: 'Hello', text: 'This is my first post')
      Post.create(author: user, title: 'Hello', text: 'This is my first post')
      Post.create(author: user, title: 'Hello', text: 'This is my first post')
      Post.create(author: user, title: 'Hello', text: 'This is my first post')
      visit '/users/1'
      expect(page).to have_content("#{user.name}", count: User.count)
      expect(page).to have_content('Picture', count: User.count)
      expect(page).to have_content("Number of posts: #{user.posts_counter}", count: User.count)
      expect(page).to have_content("#{user.bio}" , count: User.count)
      expect(page).to have_content("#{user.bio}" , count: User.count)
      expect(page).to have_content('Post #' , count: 3)
      expect(page).to have_content("See all posts")


      click_on'Post Page# 1'    
     
      expect(page).to have_current_path("/users/#{user.id}/posts/10")

      visit '/users/1'

      click_on'See all posts'

      user = User.create(id: 1,name: "tester", photo: "photo.com", bio: "All days", email: "example@email.com",
        password: "123456789")

      expect(page).to have_current_path("/users/#{user.id}/posts")
    end
  end
end