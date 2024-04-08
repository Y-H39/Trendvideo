class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  before_action :correct_user, only: :destroy

  def index
    @tags = Post.tag_counts_on(:tags).order('count DESC')
    if params[:tag].present?
      @tag_name = params[:tag]
      @tagged_posts = Post.tagged_with(params[:tag])
    end
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:notice] = "Post created!"
      redirect_to user_path(current_user)
    else
      trends_data = Post.combined_trends
      @trend_items = trends_data[:trend_items]
      @weekly_trend_items = trends_data[:weekly_trend_items]
      @monthly_trend_items = trends_data[:monthly_trend_items]
      @top_tags = Post.top_tags
      render 'pages/home', status: :unprocessable_entity
    end
  end
  
  def destroy
    @post.destroy
    flash[:success] = "Post deleted"
    if request.referrer.nil?
      redirect_to request.referer, status: :see_other
    else
      redirect_to user_path(current_user), status: :see_other
    end
  end
  
  private
  def post_params
    params.require(:post).permit(:title, :url, :comment, :tag_list)
  end

  def correct_user
    @post = current_user.posts.find_by(id: params[:id])
    redirect_to root_url, status: :see_other if @post.nil?
  end
end
