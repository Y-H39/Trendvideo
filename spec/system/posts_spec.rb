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
        fill_in_post_form('テスト1', 'https://youtu.be/QfQhyDBSGG0?si=bJ0dukmnD__EAFbK', 'お試し1', 'タグ')
        click_button 'Post'

        expect(page).to have_content('Post created!')
        expect(page).to have_content('テスト')
      end
    end

    context 'タグで絞り込むとき' do
      before do
        fill_in_post_form('テスト1', 'https://youtu.be/QfQhyDBSGG0?si=bJ0dukmnD__EAFbK', 'お試し1', 'tag1,tag2')
        click_button 'Post'
        visit root_path
        fill_in_post_form('テスト2', 'https://youtu.be/QfQhyDBSGG0?si=bJ0dukmnD__EAFbK', 'お試し2', 'tag2,tag3')
        click_button 'Post'
        visit root_path
        fill_in_post_form('テスト3', 'https://youtu.be/QfQhyDBSGG0?si=bJ0dukmnD__EAFbK', 'お試し3', 'tag3,tag4')
        click_button 'Post'
      end

      it '特定のタグで絞り込むと対象の投稿のみが表示されること' do
        click_on 'tag2', match: :first
        expect(page).to have_content('「tag2」タグを含む動画 2件')
        expect(page).to have_content('テスト1')
        expect(page).to have_content('テスト2')
        expect(page).not_to have_content('テスト3')
      end

      it '別のタグで絞り込むと対象の投稿のみが表示されること' do
        click_on 'tag3', match: :first
        expect(page).to have_content('「tag3」タグを含む動画 2件')
        expect(page).not_to have_content('テスト1')
        expect(page).to have_content('テスト2')
        expect(page).to have_content('テスト3')
      end
    end

    context '投稿に「いいね」ができるとき' do
      it '「いいね」ボタンをクリックするといいね数が表示され、再度クリックするといいね数が減ること' do
        fill_in_post_form('テスト', 'https://youtu.be/QfQhyDBSGG0?si=bJ0dukmnD__EAFbK', 'お試し', 'タグ')
        click_button 'Post'

        find('.favorite-link').click
        expect(page).to have_selector('.favorite', text: '1')
    
        find('.favorite-link').click
        expect(page).to have_selector('.favorite', text: '0')
      end

      it 'いいね一覧にいいねした投稿が表示されること' do
        fill_in_post_form('テスト', 'https://youtu.be/QfQhyDBSGG0?si=bJ0dukmnD__EAFbK', 'お試し', 'タグ')
        click_button 'Post'

        find('.favorite-link').click
        expect(page).to have_selector('.favorite', text: '1')

        find('li[role="presentation"] a[href="#tab2"]').click
        expect(page).to have_selector('.favorite', text: '1')
      end
    end
    
    context '投稿を削除できるとき' do
      it '投稿を削除すると削除メッセージが表示され、投稿が一覧から消えること' do
        fill_in_post_form('テスト', 'https://youtu.be/QfQhyDBSGG0?si=bJ0dukmnD__EAFbK', 'お試し', 'タグ')
        click_button 'Post'
        click_on 'delete', match: :first
        page.driver.browser.switch_to.alert.accept

        expect(page).to have_content('Post deleted')
        expect(page).not_to have_content('テスト')
      end
    end
  end

  describe '検索のテスト' do
    before do
      sign_in user
      visit root_path
    end

    context '検索機能が正しく動作すること' do
      before do
        fill_in_post_form('テスト1', 'https://youtu.be/QfQhyDBSGG0?si=bJ0dukmnD__EAFbK', 'お試し1', 'tag1,tag2')
        click_button 'Post'
        visit root_path
        fill_in_post_form('テスト2', 'https://youtu.be/QfQhyDBSGG0?si=bJ0dukmnD__EAFbK', 'お試し2', 'tag2,tag3')
        click_button 'Post'
        visit root_path
        fill_in_post_form('テスト3', 'https://youtu.be/QfQhyDBSGG0?si=bJ0dukmnD__EAFbK', 'お試し3', 'tag3,tag4')
        click_button 'Post'
      end
  
      it 'タイトルで検索できること' do
        fill_in 'q_title_or_tags_name_cont', with: 'テスト1'
        click_button '検索する'
  
        expect(page).to have_content('「テスト1」を含む動画 1件')
        expect(page).to have_content('テスト1')
        expect(page).not_to have_content('テスト2')
        expect(page).not_to have_content('テスト3')
      end
  
      it 'タグで検索できること' do
        fill_in 'q_title_or_tags_name_cont', with: 'tag3'
        click_button '検索する'
  
        expect(page).to have_content('「tag3」を含む動画 2件')
        expect(page).not_to have_content('テスト1')
        expect(page).to have_content('テスト2')
        expect(page).to have_content('テスト3')
      end
  
      it '空欄の場合は何も返さないこと' do
        click_button '検索する'
        expect(page).to have_content('No results found')
      end
    end
  end

  describe 'ランキングのテスト' do
    context '各ランキングが正しく表示されるかどうか' do
      before do
        @weekly_posts = create_list(:post, 2, user: user)
        @weekly_posts.each { |post| create(:favorite, user: user, post: post) }

        @monthly_posts = create_list(:post, 2, user: user, created_at: 2.week.ago)
        @monthly_posts.each { |post| create(:favorite, user: user, post: post) }

        @all_time_posts = create_list(:post, 2, user: user, created_at: 2.month.ago)
        @all_time_posts.each { |post| create(:favorite, user: user, post: post) }

        visit root_path
      end
  
      it '週間ランキングが表示され、投稿がランキング順に表示されること' do
        expect(page).to have_selector('li.active a[href="#tab1"][aria-controls="tab1"][role="tab"][data-toggle="tab"]')

        expect(page).to have_selector('.rank', text: '第1位', visible: true, wait: 10)
        expect(page).to have_selector('.rank', text: '第2位')
      end

      it '月間ランキングが表示され、投稿がランキング順に表示されること' do
        find('a[href="#tab2"]').click
        expect(page).to have_selector('li.active a[href="#tab2"][aria-controls="tab2"][role="tab"][data-toggle="tab"]')
  
        expect(page).to have_selector('.rank', text: '第1位', visible: true, wait: 10)
        expect(page).to have_selector('.rank', text: '第2位')
      end

      it '全期間ランキングが表示され、投稿がランキング順に表示されること' do
        find('a[href="#tab3"]').click
        expect(page).to have_selector('li.active a[href="#tab3"][aria-controls="tab3"][role="tab"][data-toggle="tab"]')
  
        expect(page).to have_selector('.rank', text: '第1位', visible: true, wait: 10)
        expect(page).to have_selector('.rank', text: '第2位')
      end
    end
  end
  
  def fill_in_post_form(title, url, comment, tags)
    fill_in 'post_title', with: title
    fill_in 'post_url', with: url
    fill_in 'post_comment', with: comment
    fill_in 'post_tag_list', with: tags
  end
end
