require 'rails_helper'

RSpec.describe 'User management', type: :system do
  describe 'user registration' do
    it 'allows new users to register' do
      visit new_user_registration_path

      fill_in 'Name', with: 'テスト'
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'password'

      click_button 'Sign up'

      expect(page).to have_content('Welcome! You have signed up successfully.')
    end
  end

  describe 'user login' do
    let(:user) { create(:user) }

    it 'allows registered users to log in' do
      visit new_user_session_path

      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password

      click_button 'Log in'

      expect(page).to have_content('Signed in successfully.')
    end
  end

  describe 'user edit' do
    let(:user) { create(:user) }

    it 'allows logged-in users to edit' do
      sign_in user

      visit root_path

      click_on 'Account'
      click_link 'Settings'

      fill_in 'Name', with: '更新'
      fill_in 'Email', with: 'edit@example.com'
      fill_in 'Current password', with: 'password'

      click_button 'Update'

      expect(page).to have_content('Your account has been updated successfully.')
    end
  end

  describe 'user logout' do
    let(:user) { create(:user) }

    it 'allows logged-in users to log out' do
      sign_in user

      visit root_path

      click_on 'Account'
      click_link 'Log out'

      expect(page).to have_content('Signed out successfully.')
    end
  end
end
