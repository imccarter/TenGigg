class Api::CommentsController < ApplicationController
  def show
    @comment = Comment.find(params[:id])
    render :show
  end

  def index
		@comments = Comment.find_by(commentable_id: params[:id])
  	render json: @comments
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.author_id = current_user.id
    @comment.commentable_id = params[:commentable_id]
    @comment.commentable_type = params[:commentable_type]

    if @comment.save
      render :show
    else
      render json: @comment.errors.full_messages, status: :unprocessable_entity
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:body, :commentable_id, :commentable_type)
  end
end
