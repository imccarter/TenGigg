json.extract! @comment, :id, :body, :author_id
json.author do
  json.extract! @comment.author, :id, :username, :image
end
