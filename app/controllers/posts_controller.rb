class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]

  def new
    @post = current_user.posts.new
  end

  def create
    @post = current_user.posts.new(post_params)
    @post.save

    redirect_to posts_path
  end

  def index
    @posts = Post.all
  end

  private

  def post_params
    params.require(:post).permit(:body)
  end
end
