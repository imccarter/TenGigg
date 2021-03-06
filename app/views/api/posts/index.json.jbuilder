if params[:page]
	json.total_pages @posts.total_pages
	json.page params[:page]
end

json.models do
	json.array! @posts do |post|
  	json.extract! post, :id, :author_id, :title, :image_id, :image, :created_at, :comments, :score


  	if current_user
    	json.vote do
      	json.array! post.votes.where(user_id: current_user.id)
    	end
  	end
	end
end
