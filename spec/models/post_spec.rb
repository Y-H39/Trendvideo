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
  end
end
