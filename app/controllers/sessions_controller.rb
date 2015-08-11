class SessionsController < ApplicationController
	def new
	end

	def create
		@user = User.find_by_creds(params[:user])
		if @user
			log_in(@user)
			redirect_to root_url
		else
			flash.now[:errors] = ["Invalid log in"]
			render :new
		end
	end

	def destroy
		log_out
		redirect_to root_url
	end
end
