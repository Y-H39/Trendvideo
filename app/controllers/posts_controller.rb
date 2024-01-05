class PostsController < ApplicationController
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
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to user_path(current_user)
  end
  
  private
  def post_params
    params.require(:post).permit(:title, :url, :comment)
  end
end
