class Api::PostsController < ApplicationController
  def index
    @posts = Post.all
    render json: @posts
  end

  def show
    @post = Post.find(params[:id])
    render json: @post
  end

  def post_params
    params.require(:post).permit(:title, :author_id, :popularity)
  end
end
