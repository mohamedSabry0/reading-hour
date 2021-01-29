require 'rails_helper'
# rubocop:disable Metrics/BlockLength
RSpec.feature 'Users', type: :feature do
  describe 'new user' do
    it 'sign up successfully with valid data' do
      visit 'users/sign_up'
      fill_in 'Username', with: 'per'
      fill_in 'Email', with: 'per@e.com'
      fill_in 'user_password', with: '123123'
      fill_in 'Password confirmation', with: '123123'
      click_on 'Sign up'
      expect(page).to have_content('Welcome! You have signed up successfully.')
    end
    it 'error appears with required data' do
      visit 'users/sign_up'
      fill_in 'Username', with: nil
      fill_in 'Email', with: nil
      fill_in 'user_password', with: nil
      fill_in 'Password confirmation', with: nil
      click_on 'Sign up'

      expect(page).to have_content("Email can't be blank")
      expect(page).to have_content("Password can't be blank")
      expect(page).to have_content("Username can't be blank")
      expect(page).to have_content('Username is too short (minimum is 3 characters)')
    end
  end
  before do
    visit 'users/sign_up'
    fill_in 'Username', with: 'per2'
    fill_in 'Email', with: 'per2@e.com'
    fill_in 'user_password', with: '123123'
    fill_in 'Password confirmation', with: '123123'
    click_on 'Sign up'
    click_on 'Log Out'
  end
  describe 'login' do
    it "can't login with invalid data" do
      visit 'users/sign_in'
      fill_in 'Login', with: 'nil'
      fill_in 'user_password', with: 'nil'
      click_on 'Log in'
      expect(page).to have_content('Invalid Login or password')
    end
    it 'can login with username' do
      visit 'users/sign_in'
      fill_in 'Login', with: 'per2'
      fill_in 'user_password', with: '123123'
      click_on 'Log in'
      expect(page).to have_content('Signed in successfully')
    end
    it 'can login with email' do
      visit 'users/sign_in'
      fill_in 'Login', with: 'per2@e.com'
      fill_in 'user_password', with: '123123'
      click_on 'Log in'
      expect(page).to have_content('Signed in successfully')
    end
  end
  describe 'actions' do
    it '#show' do
      visit 'users/sign_in'
      fill_in 'Login', with: 'per2'
      fill_in 'user_password', with: '123123'
      click_on 'Log in'
      visit user_path(User.find_by_username('per2'))
      expect(page).to have_content('All Groups')
    end
  end
end
# rubocop:enable Metrics/BlockLength
