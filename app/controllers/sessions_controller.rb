class SessionsController < ApplicationController
	def new
		render :new
	end

	def create
		@user = User.find_by_creds(params[:user])
		if @user
			log_in(@user)
			redirect_to root_url
		else
			flash.now[:errors] = "Whoops, that wasn't right... Try again, maybe?"
			render :new
		end
	end

	def destroy
		log_out
		render json: ActiveSupport::JSON.encode({msg: 'success'})
	end
end
