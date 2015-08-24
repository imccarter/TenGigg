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
  "Informative",
  "Cute",
  "Awesome"
]

category_list.each do |category_name|
  Category.create(name: category_name)
end

default_profile_pic = Image.create(
  url: "http://res.cloudinary.com/dwds5fsan/image/upload/w_150,h_150,c_fill/v1440028989/default_dqhmax.png",
  thumbnail_url: "http://res.cloudinary.com/dwds5fsan/image/upload/w_75,h_75,c_fill/v1440028989/default_dqhmax.png",
  width: 500,
  height: 500
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

# cute_puppy = Image.create(
# 	url:
# 	thumnail_url:
# )



# image1 = Image.create(
#   url: "http://res.cloudinary.com/dwds5fsan/image/upload/v1439847620/le9gqqfkqayg7sfzqkpp.jpg",
#   thumbnail_url: "http://res.cloudinary.com/dwds5fsan/image/upload/c_fill,h_90,w_90/v1439584002/zdbn1vwgel6orzfpdjug.jpg",
#   width: 800,
#   height: 600
# )
#
# image2 = Image.create(
#   url: "http://res.cloudinary.com/dwds5fsan/image/upload/v1439751346/ws8bftsnwr0hhvldrgfh.png",
#   thumbnail_url: "http://res.cloudinary.com/dwds5fsan/image/upload/c_fill,h_90,w_90/v1439751346/ws8bftsnwr0hhvldrgfh.png",
#   width: 800,
#   height: 600
# )
#
# post1 = Post.create(title: "THE UNICORN", author_id: 1, image: image1, image_id: image1.id,
#   categories: [Category.find(2), Category.find(3)])
#
#
# post2 = Post.create(title: "This tree", author_id: 2, image: image2, image_id: image2.id,
#   categories: [Category.find(3), Category.find(4), Category.find(6)])
#
# comment1 = Comment.create(body: "Shockingly beautiful.", author_id: 1, commentable_id: 1, commentable_type: "Post")




# Seed ideas:
# ~6 demo users with names
# ~20 posts
# 0-4 comments per post
# Posts:
# 
# Animals:
# Cute puppy: Here's an adorable puppy you can stare at so you don't have to think about
# the triviality of your contribution to society.
# 
# Cute kitten: Let's all just upvote this photo of a kitten that I just googled so I can
# rest easy knowing that I have more internet points than you.
# 
# Weird animal: This animal is so interesting to me because any wildlife in my immediate 
# vicinity has been ravished by decades of human negligence.
# 
# Endangered animal: Rather than actually trying to do something about it, I'm going
# to feel better about myself by "raising awareness" about this poor animal's plight.
# 
# Sloth (thumbs upping?): Charismatic megafauna always get the upvotes.
# 
# Funny gif: My studies confirm that users desire short loops of silent low-quality
# video of animals acting silly.
# 
# Media:
# GoT meme: Apparently the target demographic of this website universally enjoys this
# television program. **Skip?**
# 
# Use the force, Harry: Here is an in-joke with references to media that this userbase is 
# fond of.
# 
# Poorly made fan-art: Hey everyone, I'm an artist! I'm going to publicly display my work
# and then get really defensive when someone inevitably insults it!
# 
# Office-gif with subtitles: Because your mind can fill in the voices for you.
# 
# Misc:
# Renaissance painting: I don't know why I posted this here. Move along.
# 
# Infographic: If you think you've learned something, you'll feel less like you're letting 
# your life slip between your fingers as you waste countless hours browsing the internet.
# 
# First-world-problem: There's no way that bemoaning a minor grievance common to most people 
# in a developed nation can get downvoted on the internet!
# 
# earth-porn: Maybe if you stare long enough without blinking you can trick your brain into
# thinking that you're physically there and doing something with your life.
# 
# Motivational image: Well, this just seems counterintuitive to post if we want people
# to actually stay on this site.
# 
# Inspirational quote: Because someone famous said it, it carries more meaning.
#
# Stick-figure gif: How long do people spend making these animations with the only obvious
# gain of stoking their internet ego?

