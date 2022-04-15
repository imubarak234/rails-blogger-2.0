require 'rails_helper'

RSpec.describe 'Login Page', type: :feature do
  describe 'Testing page functions' do
    it 'Check for username field' do
      visit "/users/sign_in"
      page.has_field?('Email', type: 'email')
    end

    it 'Check for password field' do
      visit "/users/sign_in"
      page.has_field?('Password', type: 'password')
    end

    it 'Check for Submit button' do
      visit "/users/sign_in"
      page.has_button?('Log in')
    end

    it "Test clicking the Log-in without filling Username and Password" do
      visit "/users/sign_in"
      click_button 'Log in'
      expect(page).to have_content 'Please Enter an Email Address.' 
      expect(page).to have_content 'Please provide Password.' 
    end
    
    it "Test clicking the Log-in with false input" do
        visit '/users/sign_in'
        within("#session") do
          fill_in 'Email', with: 'example@ggg.com'
          expect(page).to have_selector("input[value='example@ggg.com']")
          fill_in 'Password', with: '12233223'
          expect(page).to have_selector("input[value='12233223']")
        end
        click_button 'Log in'
        expect(page).to have_current_path('/users/sign_in')
        visit '/users/sign_in'
        expect(page).to have_content 'User does not exist.' 
    end

    it "Test clicking the Log-in with True input" do
      user = User.create(name: "tester", photo: "photo.com", bio: "All days", email: "example@email.com",
        password: "123456789")
        visit '/users/sign_in'
        within("#session") do
          fill_in 'Email', with: 'example@email.com'
          expect(page).to have_selector("input[value='example@email.com']")
          fill_in 'Password', with: '123456789'
          expect(page).to have_selector("input[value='123456789']")
        end
        click_button 'Log in'
        #visit '/users/'
        expect(page).to have_current_path('/')
    end

  end

end