require 'rails_helper'

RSpec.describe 'Post management', type: :system do
  describe '投稿に関するテスト' do
    let!(:user) { create(:user) }
  
    describe "投稿のテスト" do
      before do
        sign_in user
      end
  
      context "投稿が成功したとき" do
        it "投稿に関する一連の流れが期待通りか" do
          visit root_path
  
          fill_in 'post_title', with: 'テスト'
          fill_in 'post_url', with: 'https://youtu.be/QfQhyDBSGG0?si=bJ0dukmnD__EAFbK'
          fill_in 'post_comment', with: 'お試し'
  
          click_button 'Post'
  
          expect(page).to have_content('Post created!')
          expect(page).to have_content('テスト')

          click_on 'delete', match: :first
          page.driver.browser.switch_to.alert.accept

          expect(page).to have_content('Post deleted')
          expect(page).to_not have_content('テスト')
        end
      end
    end
  end
end
