class Post < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy

  validates :title, presence: true, length: { maximum: 50 }
  validate :url_should_start_with_youtube
  validates :comment, length: { maximum: 50 }

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  def self.trend
    Post.find(Favorite.group(:post_id).order('count(post_id) desc').limit(10).pluck(:post_id))
  end

  def self.ransackable_attributes(auth_object = nil)
    auth_object ? super : %w(title comment)
  end

  private
  def url_should_start_with_youtube
    unless url&.start_with?("https://youtu.be/")
      errors.add(:url, "は'https://youtu.be/'から始まる必要があります")
    end
  end
end
