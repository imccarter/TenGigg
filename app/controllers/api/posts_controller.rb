class Api::PostsController < ApplicationController
  def index
    @posts = Post.order(popularity: :desc)
    render json: @posts
  end

  def show
    @post = Post.find(params[:id])
    render json: @post
  end

  def create
    @post = Post.new(post_params)
  end

  private
  def post_params
    params.require(:post).permit(:title, :author_id, :popularity)
  end
end
