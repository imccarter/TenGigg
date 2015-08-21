json.array! @posts do |post|
  json.extract! post, :id, :author_id, :title, :popularity, :image_id, :image, :created_at, :comments, :score


  if current_user
    json.vote do
      json.array! post.votes.where(user_id: current_user.id)
    end
  end
end
