class PagesController < ApplicationController
  def home
    @post_favorite_ranks = Post.find(Favorite.group(:post_id).order('count(post_id) desc').pluck(:post_id))
  end
end
