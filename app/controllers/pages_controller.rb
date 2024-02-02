class PagesController < ApplicationController
  def home
    @post = current_user.posts.build if user_signed_in?
    trends_data = Post.combined_trends
    @trend_items = trends_data[:trend_items]
    @weekly_trend_items = trends_data[:weekly_trend_items]
    @monthly_trend_items = trends_data[:monthly_trend_items]
    @top_tags = Post.top_tags
  end
end
