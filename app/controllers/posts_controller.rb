class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  before_action :correct_user, only: :destroy

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:notice] = "Post created!"
      redirect_to user_path(current_user)
    else
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
    params.require(:post).permit(:title, :url, :comment)
  end

  def correct_user
    @post = current_user.posts.find_by(id: params[:id])
    redirect_to root_url, status: :see_other if @post.nil?
  end
end
