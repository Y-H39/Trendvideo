class PostsController < ApplicationController
  def index
    @posts = Post.all
  end
  
  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:notice] = "Post created!"
      redirect_to posts_path
    else
      render 'pages/home', status: :unprocessable_entity
     end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end
  
  private
  def post_params
    params.require(:post).permit(:title, :url, :comment)
  end
end
