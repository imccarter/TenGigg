class Api::PostsController < ApplicationController
	before_action :require_log_in, only: [:create]

  def index
    if params[:category]
      category = Category.includes(:posts).find_by(name: params[:category])
      if category
        @posts = category.posts
      else
        render json: ["category does not exist"], status: 422
      end
    elsif params[:recent]
    	@posts = Post.all.sort_by &:created_at
    else
      @posts = Post.all.sort_by { |post| - post.score }
    end
		@all_posts = @posts
		@posts = Kaminari.paginate_array(@posts)
    @posts = @posts.page(params[:page]).per(5)
    render :index
  end

  def user_posts
    if params[:user_id]
      user = User.find(params[:user_id])
    else
      user = current_user
    end

    if !user
      render json: ["could not find user"], status: 422
      return
    end

    case params[:posts]
    when "authored"
      @posts = user.posts
    when "commented"
      @posts = user.commented_posts
		when "upvoted"
			@posts = user.upvoted_posts
    else
      @posts = user.all_posts
    end

    render :index
  end

  def random
    @posts = Post.all.sample(10)
    render :index
  end

	def all_posts
		@posts = Post.all
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
      render :show
    else
      render json: @post.errors.full_messages, status: :unprocessable_entity
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :image_id, :category_ids => [])
  end
end
