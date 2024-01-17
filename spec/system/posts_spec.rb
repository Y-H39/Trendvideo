require 'rails_helper'

RSpec.describe 'Post management', type: :system do
  let!(:user) { create(:user) }

  describe '投稿のテスト' do
    before do
      sign_in user
      visit root_path
    end

    context '投稿が成功したとき' do
      it '投稿が成功するとメッセージが表示されること' do
        fill_in_post_form('テスト', 'https://youtu.be/QfQhyDBSGG0?si=bJ0dukmnD__EAFbK', 'お試し')
        click_button 'Post'

        expect(page).to have_content('Post created!')
        expect(page).to have_content('テスト')
      end
    end

    context '投稿に「いいね」ができるとき' do
      it '「いいね」ボタンをクリックするといいね数が表示され、再度クリックするといいね数が減ること' do
        fill_in_post_form('テスト', 'https://youtu.be/QfQhyDBSGG0?si=bJ0dukmnD__EAFbK', 'お試し')
        click_button 'Post'

        find('span', text: '0 いいね').click
        expect(page).to have_content('1 いいね')
    
        find('span', text: '1 いいね').click
        expect(page).to have_content('0 いいね')
      end
      it 'いいね一覧にいいねした投稿が表示されること' do
        fill_in_post_form('テスト', 'https://youtu.be/QfQhyDBSGG0?si=bJ0dukmnD__EAFbK', 'お試し')
        click_button 'Post'

        find('span', text: '0 いいね').click
        expect(page).to have_content('1 いいね')

        find('li[role="presentation"] a[href="#tab2"]').click
        expect(page).to have_content('1 いいね')
      end
    end
    
    context '投稿を削除できるとき' do
      it '投稿を削除すると削除メッセージが表示され、投稿が一覧から消えること' do
        fill_in_post_form('テスト', 'https://youtu.be/QfQhyDBSGG0?si=bJ0dukmnD__EAFbK', 'お試し')
        click_button 'Post'
        click_on 'delete', match: :first
        page.driver.browser.switch_to.alert.accept

        expect(page).to have_content('Post deleted')
        expect(page).not_to have_content('テスト')
      end
    end
  end

  def fill_in_post_form(title, url, comment)
    fill_in 'post_title', with: title
    fill_in 'post_url', with: url
    fill_in 'post_comment', with: comment
  end
end
