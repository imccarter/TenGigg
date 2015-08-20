json.extract! @post, :id, :author_id, :author, :title, :popularity, :image_id, :image, :score#, :vote ...
json.categories do
  json.array! @post.categories do |category|
    json.extract! category, :id, :name
  end
end
json.comments do
	json.array! @post.comments do |comment|
		json.extract! comment, :id, :body, :author_id, :commentable_id, :commentable_type
    json.author comment.author, :id, :username
	end
end

# post.vote returns status of current_user's vote on the post
