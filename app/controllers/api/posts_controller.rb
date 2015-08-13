class Api::PostsController < ApplicationController
  def index
    @posts = Post.order(popularity: :desc)
    render :index
    # render json: @posts
  end

  def show
    @post = Post.find(params[:id])
    # render json: @post
    render :show
  end

  def create
    @post = Post.new(post_params)
    @post.author_id = current_user.id
    if @post.save
      render json: @post
    else
      render json: @post.errors.full_messages, status: :unprocessable_entity
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :popularity, :image_id)
  end
end
