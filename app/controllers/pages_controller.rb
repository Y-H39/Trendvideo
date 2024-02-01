class PagesController < ApplicationController
  def home
    @post = current_user.posts.build if user_signed_in?
    @trend_items = Post.trend
    @top_tags = Post.top_tags
  end
end
