class Api::PostsController < ApplicationController

  def index
    if params[:category]
      category = Category.includes(:posts).find_by(name: params[:category])
      if category
        @posts = category.posts
        render :index
      else
        render json: ["category does not exist"], status: 422
      end

    elsif params[:user_id]
      user = User.includes(:posts).find(params[:user_id])
      if user
        case params[:posts]
        when "authored"
          @posts = user.posts
          render :index
        when "commented"
          @posts = user.commented_posts
          render :index
        when "all"
          @posts = user.all_posts
          render :index
        end
      else
        render json: ["could not find user"], status: 422
      end
      
    else
      @posts = Post.order(popularity: :desc)
      render :index
    end

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
