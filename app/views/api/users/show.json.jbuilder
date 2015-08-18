json.extract! @user, :id, :username, :image_id
json.posts do
  json.array! @user.posts do |post|
    json.extract! post, :image, :id, :title, :created_at, :image_id, :comments, :popularity
  end
end
json.comments do
  json.array! @user.comments do |comment|
    json.extract! comment, :id, :body, :commentable_id, :commentable_type
  end
end
