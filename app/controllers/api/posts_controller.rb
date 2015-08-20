class Api::PostsController < ApplicationController

  def index
    if params[:category]
      category = Category.includes(:posts).find_by(name: params[:category])
      if category
        @posts = category.posts
      else
        render json: ["category does not exist"], status: 422
      end

    elsif params[:user_id]
      user = User.includes(:posts).find(params[:user_id])
      if user
        case params[:posts]
        when "authored"
          @posts = user.posts
        when "commented"
          @posts = user.commented_posts
        when "all"
          @posts = user.all_posts
        end
      else
        render json: ["could not find user"], status: 422
      end

    else
      @posts = Post.order(popularity: :desc)
    end
    render :index
  end

  def random
    @posts = Post.all.sample(10)
    render :index
  end

  def show
    @post = Post.find(params[:id])
    render :show
  end

  def create
    @post = Post.new(post_params)
    @post.author_id = current_user.id
    @post.category_ids = params[:category_ids]

    if @post.save
      render json: @post
    else
      render json: @post.errors.full_messages, status: :unprocessable_entity
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :popularity, :image_id, :category_ids => [])
  end
end
