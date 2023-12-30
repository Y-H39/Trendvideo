class PagesController < ApplicationController
  def home
    @trend_items = Post.trend
  end
end
