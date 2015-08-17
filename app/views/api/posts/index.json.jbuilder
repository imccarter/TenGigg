json.array! @posts do |post|
  json.extract! post, :id, :author_id, :title, :popularity, :image_id, :image, :created_at, :comments
end
