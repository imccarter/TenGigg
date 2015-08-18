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


image1 = Image.create(
  url: "http://res.cloudinary.com/dwds5fsan/image/upload/v1439847620/le9gqqfkqayg7sfzqkpp.jpg",
  thumbnail_url: "http://res.cloudinary.com/dwds5fsan/image/upload/c_limit,h_60,w_90/v1439584002/zdbn1vwgel6orzfpdjug.jpg",
  width: 800,
  height: 600
)

image2 = Image.create(
  url: "http://res.cloudinary.com/dwds5fsan/image/upload/v1439751346/ws8bftsnwr0hhvldrgfh.png",
  thumbnail_url: "http://res.cloudinary.com/dwds5fsan/image/upload/c_limit,h_60,w_90/v1439751346/ws8bftsnwr0hhvldrgfh.png",
  width: 800,
  height: 600
)

user = User.create(
  username: "Demo User",
  password_digest: "$2a$10$Ur.Oi2bJWfC3kf38CI8Up.VTtCHifYokRxbrxY/UWttFWN1MksPB6",
  session_token: "k3HjY00uUyS9d8GTVqyqrQ"
)

guest = User.create(
  username: "Guest",
  password_digest: "$2a$10$Sxn33rNu7KOajKen4deAzumB.in8m1nL0DiTce2dyux97cyOh/ZDK",
  session_token: "bz1tszdqfzYP4Yr8dj8UOQ"
)

post1 = Post.create(title: "THE UNICORN", author_id: 1, image: image1, image_id: image1.id, popularity: 3,
  categories: [Category.find(2), Category.find(3)])


post2 = Post.create(title: "This tree", author_id: 2, image: image2, image_id: image2.id, popularity: -2,
  categories: [Category.find(3), Category.find(4), Category.find(6)])

comment1 = Comment.create(body: "Shockingly beautiful.", author_id: 1, commentable_id: 1, commentable_type: "Post")
