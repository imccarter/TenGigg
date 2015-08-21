json.extract! @comment, :id, :body, :author_id
json.author do
  json.extract! @comment.author, :id, :username
  json.thumbnail_url @comment.author.image.thumbnail_url
end
