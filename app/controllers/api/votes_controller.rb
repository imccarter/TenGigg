class Api::VotesController < ApplicationController
  def create
    @vote = current_user.votes.new(like_params)
    if @vote.save
      render json: @vote
    else
      render json: @vote.errors.full_messages, status: 422
    end
  end

  def destroy
    @vote = Vote.find(params[:id])
    @vote.destroy
    render json: @vote
  end

  private
  def vote_params
    params.require(:vote).permit(:post_id, :vote_score)
  end
end
