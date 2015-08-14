# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
category_list = [
  "Funny",
  "Shocking",
  "Beautiful",
  "Horrible",
  "Cute",
  "Awesome"
]

category_list.each do |category_name|
  Category.create(name: category_name)
end


image = Image.create(
  url: "http://res.cloudinary.com/dwds5fsan/image/upload/v1439584002/zdbn1vwgel6orzfpdjug.jpg",
  thumbnail_url: "http://res.cloudinary.com/dwds5fsan/image/upload/c_limit,h_60,w_90/v1439584002/zdbn1vwgel6orzfpdjug.jpg",
  width: 800,
  height: 600
)


post = Post.create(title: "THE UNICORN", author_id: 1, image: image, image_id: image.id, popularity: 3,
  categories: [Category.first, Category.last])
