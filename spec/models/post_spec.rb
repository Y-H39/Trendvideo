require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'メソッド' do
    let(:user) { create(:user) }
    let(:post) { create(:post, user: user) }

    describe '#favorited_by?' do
      it 'ユーザーがポストをお気に入りにしている場合、trueを返すこと' do
        favorite = create(:favorite, user: user, post: post)
        expect(post.favorited_by?(user)).to be true
      end

      it 'ユーザーがポストをお気に入りにしていない場合、falseを返すこと' do
        other_user = create(:user)
        expect(post.favorited_by?(other_user)).to be false
      end
    end

    describe '.trend' do
      it 'お気に入りが多い上位10件のポストを返すこと' do
        15.times { create(:favorite, post: create(:post)) }

        trending_posts = Post.trend
        expect(trending_posts.count).to eq(10)
      end
    end

    describe 'バリデーション' do
      it '正しいデータは有効であること' do
        valid_post = build(:post, user: user)
        expect(valid_post).to be_valid
      end

      it 'タイトルが未入力の場合、無効であること' do
        invalid_post = build(:post, user: user, title: '')
        expect(invalid_post).to be_invalid
      end

      it 'URLが指定の文言から始まらない場合、無効であること' do
        invalid_post = build(:post, user: user, url: 'https://example.com')
        expect(invalid_post).to be_invalid
      end

      it 'タイトル、コメントが50文字を超える場合、無効であること' do
        invalid_post = build(:post, user: user, title: 'a' * 51)
        expect(invalid_post).to be_invalid

        invalid_post = build(:post, user: user, comment: 'a' * 51)
        expect(invalid_post).to be_invalid
      end

      it 'タグが10文字を超える場合、エラーが追加されること' do
        post.tag_list = ['tag_with_more_than_10_characters']
        post.valid?

        expect(post.errors[:base]).to include('Tag is too long')
      end
    end
  end
end
