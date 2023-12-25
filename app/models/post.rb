class Post < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  default_scope -> { order(created_at: :desc) }

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
end
