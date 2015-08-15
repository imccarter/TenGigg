class Api::CommentsController < ApplicationController
  def show
    @comment = Comment.find(params[:id])
    render :show
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.author_id = current_user.id
    # Set parent commentable here??
    if @comment.save
      render json: @comment
    else
      render json: @comment.errors.full_messages, status: :unprocessable_entity
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end
