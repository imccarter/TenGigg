class Api::UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
		render :show
	end

	def index
		@users = User.all
		render json: @users
	end

	private
	def user_params
		params.require(:user).permit(:username, :image_id)
	end
end
