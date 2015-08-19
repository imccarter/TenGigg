json.extract! @user, :id, :username, :image_id
json.posts do
  json.array! @user.all_posts do |post|
    json.extract! post, :id, :author_id, :title, :created_at, :popularity, :image_id, :image, :comments
  end
end
json.comments do
  json.array! @user.comments do |comment|
    json.extract! comment, :id, :body, :author_id, :commentable_id, :commentable_type
  end
end
