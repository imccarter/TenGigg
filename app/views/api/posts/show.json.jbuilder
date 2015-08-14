json.extract! @post, :id, :author_id, :title, :popularity, :image_id, :image
json.categories do
  json.array! @post.categories do |category|
    json.extract! category, :id, :name
  end
end
