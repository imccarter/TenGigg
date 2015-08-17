json.extract! @post, :id, :author_id, :user, :title, :popularity, :image_id, :image
json.categories do
  json.array! @post.categories do |category|
    json.extract! category, :id, :name
  end
end
# json.comments do
# 	json.array! @post.comments do |comment|
# 		json.extract! comment, :id, :body, :author-id
# 	end
# end
