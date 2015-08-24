json.array! @users do |user|
	json.extract! user, :id, :username, :image_id
end