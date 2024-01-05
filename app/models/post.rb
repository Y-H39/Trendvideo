class Post < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  def self.trend
    Post.find(Favorite.group(:post_id).order('count(post_id) desc').limit(10).pluck(:post_id))
  end

  def self.ransackable_attributes(auth_object = nil)
    auth_object ? super : %w(title comment)
  end
end
