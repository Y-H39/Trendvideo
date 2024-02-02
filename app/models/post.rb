class Post < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  acts_as_taggable

  validates :title, presence: true, length: { maximum: 50 }
  validate :url_should_start_with_youtube
  validates :comment, length: { maximum: 50 }
  validate :validate_tag_length

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  def self.combined_trends
    trend_items = Post.find(Favorite.group(:post_id).order('count(post_id) desc').limit(10).pluck(:post_id))
    weekly_trend_items = Post.find(Favorite.joins(:post).where('posts.created_at >= ?', 1.week.ago).group(:post_id).order('count(post_id) desc').limit(10).pluck(:post_id))
    monthly_trend_items = Post.find(Favorite.joins(:post).where('posts.created_at >= ?', 1.month.ago).group(:post_id).order('count(post_id) desc').limit(10).pluck(:post_id))
    {
      trend_items: trend_items,
      weekly_trend_items: weekly_trend_items,
      monthly_trend_items: monthly_trend_items
    }
  end

  def self.top_tags(limit = 5)
    ActsAsTaggableOn::Tag.order(taggings_count: :desc).limit(limit)
  end

  private
  def url_should_start_with_youtube
    unless url&.start_with?("https://youtu.be/")
      errors.add(:url, "は'https://youtu.be/'から始まる必要があります")
    end
  end

  def validate_tag_length
    errors.add(:base, 'Tag is too long') if tag_list.any? { |tag| tag.length > 10 }
  end
end
