json.extract! @user, :id, :username, :image_id, :image

json.all_posts do
  json.array! @user.all_posts do |post|
    json.partial! 'api/posts/posts', post: post
  end
end

json.commented_posts do
  json.array! @user.commented_posts do |post|
    json.partial! 'api/posts/posts', post: post
  end
end

json.posts do
   json.array! @user.posts do |post|
     json.partial! 'api/posts/posts', post: post
   end
end

json.comments do
  json.array! @user.comments do |comment|
    json.extract! comment, :id, :body, :author_id, :commentable_id, :commentable_type
  end
end
