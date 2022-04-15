RSpec.describe 'Index Page', type: :feature do
  
  describe 'Testing page functions' do
    it 'Check for usernames' do
      user = User.create(id: 1,name: "tester", photo: "photo.com", bio: "All days", email: "example@email.com",
        password: "123456789")
      visit '/users'
      expect(page).to have_content 'Username'
      expect(page).to have_content 'Picture'
      expect(page).to have_content "Number of posts: #{user.posts_counter}"
      click_on'Users Page'
     
      expect(page).to have_current_path("/users/#{user.id}")
    end
  end
end