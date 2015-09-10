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
  thumbnail_url: "http://res.cloudinary.com/dwds5fsan/image/upload/w_75,h_75,c_fill/v1440028989/default_dqhmax.png"
)

prof_cage = Image.create(
	url: "http://res.cloudinary.com/dwds5fsan/image/upload/w_150,h_150,c_fill/v1440453901/Cage_mvwvix.jpg",
	thumbnail_url: "http://res.cloudinary.com/dwds5fsan/image/upload/w_75,h_75,c_fill/v1440453901/Cage_mvwvix.jpg"
)

prof_keanu = Image.create(
	url: "http://res.cloudinary.com/dwds5fsan/image/upload/w_150,h_150,c_fill/v1440453907/Keanu_khd0dl.jpg",
	thumbnail_url: "http://res.cloudinary.com/dwds5fsan/image/upload/w_75,h_75,c_fill/v1440453907/Keanu_khd0dl.jpg"
)

prof_father = Image.create(
	url: "http://res.cloudinary.com/dwds5fsan/image/upload/w_150,h_150,c_fill/v1440453907/father_a2zr0d.jpg",
	thumbnail_url: "http://res.cloudinary.com/dwds5fsan/image/upload/w_75,h_75,c_fill/v1440453907/father_a2zr0d.jpg"
)

prof_walrus = Image.create(
	url: "http://res.cloudinary.com/dwds5fsan/image/upload/w_150,h_150,c_fill/v1440453910/walrus_yvwm9h.png",
	thumbnail_url: "http://res.cloudinary.com/dwds5fsan/image/upload/w_75,h_75,c_fill/v1440453910/walrus_yvwm9h.png"
)

prof_xp = Image.create(
	url: "http://res.cloudinary.com/dwds5fsan/image/upload/w_150,h_150,c_fill/v1440453907/xpdefault_kqwzcv.jpg",
	thumbnail_url: "http://res.cloudinary.com/dwds5fsan/image/upload/w_75,h_75,c_fill/v1440453907/xpdefault_kqwzcv.jpg"
)

prof_doge = Image.create(
	url: "http://res.cloudinary.com/dwds5fsan/image/upload/w_150,h_150,c_fill/v1440453906/doge_tk6lk7.jpg",
	thumbnail_url: "http://res.cloudinary.com/dwds5fsan/image/upload/w_75,h_75,c_fill/v1440453906/doge_tk6lk7.jpg"
)

user1 = User.create(
  username: "PtntZr0",
  password_digest: "$2a$10$Ur.Oi2bJWfC3kf38CI8Up.VTtCHifYokRxbrxY/UWttFWN1MksPB6",
  session_token: "k3HjY00uUyS9d8GTVqyqrQ",
  image: prof_cage, image_id: prof_cage.id
)

guest = User.create(
  username: "Guest",
  password_digest: "$2a$10$Sxn33rNu7KOajKen4deAzumB.in8m1nL0DiTce2dyux97cyOh/ZDK",
  session_token: "bz1tszdqfzYP4Yr8dj8UOQ"
)

user3 = User.create(
	username: "0pin10n8d",
	password_digest: "$2a$10$uu6MD52.tO76iaA8Kfqh3u.4/RILd96Q9AvJadEexkMroH0czvWLC",
	session_token: "yG6vxUh1N1N_6_ZB6Zd9EQ",
  image: prof_walrus, image_id: prof_walrus.id
)

user4 = User.create(
  username: "anml<3r",
  password_digest: "$2a$10$rW1Cz9Fufs0xoA./MNbBVOoKUCydqyEKwD1.x.mRACliq/qAZ165S",
  session_token: "ig_6pBlklNcWn_iwICbI0Q",
  image: prof_father, image_id: prof_father.id
)

user5 = User.create(
  username: "the_1_uPPer",
  password_digest: "$2a$10$XIPENryNXGTHOdv/kuwtCOeHfK3ceOPPRWMq0NBIdh0LUH.cR5/D.",
  session_token: "hZgqMvkz3WjWUMeeOjLCAg",
  image: prof_doge, image_id: prof_doge.id
)

user6 = User.create(
  username: "321chemtrails",
  password_digest: "$2a$10$EfCBYcsba2OHVhvEoHXdROfMur/QEs5lpxbtbD5VEko2z8Cw4f7Ze",
  session_token: "6OVdQDHrK0JhlA-g2M51Bg",
  image: prof_keanu, image_id: prof_keanu.id
)

user7 = User.create(
  username: "mamameme",
  password_digest: "$2a$10$9vwP4h/P9fmzKS4WgQSsCuY3CwzvUop/tBEFKfaK6hcNOaerm7nlC",
  session_token: "RP6JBc3vYJOCvGi584V8fQ",
  image: prof_xp, image_id: prof_xp.id
)

#IMAGES
puppy = Image.create(
	url: "http://res.cloudinary.com/dwds5fsan/image/upload/w_550,h_550,c_fit/v1440395159/rottweiler-puppy_mgfnww.jpg",
	thumbnail_url: "http://res.cloudinary.com/dwds5fsan/image/upload/w_90,h_90,c_fill/v1440395159/rottweiler-puppy_mgfnww.jpg"
)

kitten = Image.create(
	url: "http://res.cloudinary.com/dwds5fsan/image/upload/w_550,h_550,c_fit/v1440395298/tumblr_nrzqf36AAP1ssska3o1_500_iop0i8.jpg",
	thumbnail_url: "http://res.cloudinary.com/dwds5fsan/image/upload/w_90,h_90,c_fill/v1440395298/tumblr_nrzqf36AAP1ssska3o1_500_iop0i8.jpg"
)

tenerec = Image.create(
	url: "http://res.cloudinary.com/dwds5fsan/image/upload/w_550,h_550,c_fit/v1440437094/tenerec_oei8z8.jpg",
	thumbnail_url: "http://res.cloudinary.com/dwds5fsan/image/upload/w_90,h_90,c_fill/v1440437094/tenerec_oei8z8.jpg"
)

condor = Image.create(
	url: "http://res.cloudinary.com/dwds5fsan/image/upload/w_550,h_550,c_fit/v1440436981/California_Condor_fx5cap.jpg",
	thumbnail_url: "http://res.cloudinary.com/dwds5fsan/image/upload/w_90,h_90,c_fill/v1440436981/California_Condor_fx5cap.jpg"
)

sloth = Image.create(
	url: "http://res.cloudinary.com/dwds5fsan/image/upload/w_550,h_550,c_fit/v1440437087/sloth_qlqxkd.jpg",
	thumbnail_url: "http://res.cloudinary.com/dwds5fsan/image/upload/w_90,h_90,c_fill/v1440437087/sloth_qlqxkd.jpg"
)

dog_gif = Image.create(
	url: "http://res.cloudinary.com/dwds5fsan/image/upload/w_550,h_550,c_fit/v1440303235/qfi42n0dzvrmuhkrg9wn.gif",
	thumbnail_url: "http://res.cloudinary.com/dwds5fsan/image/upload/w_90,h_90,c_fill/v1440303235/qfi42n0dzvrmuhkrg9wn.gif"
)

harry_force = Image.create(
	url: "http://res.cloudinary.com/dwds5fsan/image/upload/w_550,h_550,c_fit/v1440437026/Force_harry_sxjeud.jpg",
	thumbnail_url: "http://res.cloudinary.com/dwds5fsan/image/upload/w_90,h_90,c_fill/v1440437026/Force_harry_sxjeud.jpg"
)

unicorn_art = Image.create(
	url: "http://res.cloudinary.com/dwds5fsan/image/upload/w_550,h_550,c_fit/v1440436955/bad_unicorn_zmvrre.jpg",
	thumbnail_url: "http://res.cloudinary.com/dwds5fsan/image/upload/w_90,h_90,c_fill/v1440436955/bad_unicorn_zmvrre.jpg"
)

office_gif = Image.create(
	url: "http://res.cloudinary.com/dwds5fsan/image/upload/w_550,h_550,c_fit/v1440453384/office_no_uhyuty.gif",
	thumbnail_url: "http://res.cloudinary.com/dwds5fsan/image/upload/w_90,h_90,c_fill/v1440453384/office_no_uhyuty.gif"
)

cezanne = Image.create(
	url: "http://res.cloudinary.com/dwds5fsan/image/upload/w_550,h_550,c_fit/v1440437002/cezanne_mont_sainte-victoire_atziln.jpg",
	thumbnail_url: "http://res.cloudinary.com/dwds5fsan/image/upload/w_90,h_90,c_fill/v1440437002/cezanne_mont_sainte-victoire_atziln.jpg"
)

infograph = Image.create(
	url: "http://res.cloudinary.com/dwds5fsan/image/upload/w_550,h_550,c_fit/v1440437110/What_makes_good_infographic_h8hhtg.png",
	thumbnail_url: "http://res.cloudinary.com/dwds5fsan/image/upload/w_90,h_90,c_fill/v1440437110/What_makes_good_infographic_h8hhtg.png"
)

first_world_meme = Image.create(
	url: "http://res.cloudinary.com/dwds5fsan/image/upload/w_550,h_550,c_fit/v1440437022/first_world_rcomvl.jpg",
	thumbnail_url: "http://res.cloudinary.com/dwds5fsan/image/upload/w_90,h_90,c_fill/v1440437022/first_world_rcomvl.jpg"
)

earth_porn1 = Image.create(
	url: "http://res.cloudinary.com/dwds5fsan/image/upload/w_550,h_550,c_fit/v1440437044/jSiBWHS6Q7efg_v1pt2e.jpg",
	thumbnail_url: "http://res.cloudinary.com/dwds5fsan/image/upload/w_90,h_90,c_fill/v1440437044/jSiBWHS6Q7efg_v1pt2e.jpg"
)

earth_porn2 = Image.create(
	url: "http://res.cloudinary.com/dwds5fsan/image/upload/w_550,h_550,c_fit/v1440437050/jxLkF3jX3lIW9_wyqnx5.jpg",
	thumbnail_url: "http://res.cloudinary.com/dwds5fsan/image/upload/w_90,h_90,c_fill/v1440437050/jxLkF3jX3lIW9_wyqnx5.jpg"
)

bill_gates = Image.create(
	url: "http://res.cloudinary.com/dwds5fsan/image/upload/w_550,h_550,c_fit/v1440436947/11-motivational-quotes_e8bwoo.jpg",
	thumbnail_url: "http://res.cloudinary.com/dwds5fsan/image/upload/w_90,h_90,c_fill/v1440436947/11-motivational-quotes_e8bwoo.jpg"
)

motivational = Image.create(
	url: "http://res.cloudinary.com/dwds5fsan/image/upload/w_550,h_550,c_fit/v1440437014/famousquotes_vam6z8.jpg",
	thumbnail_url: "http://res.cloudinary.com/dwds5fsan/image/upload/w_90,h_90,c_fill/v1440437014/famousquotes_vam6z8.jpg"
)

##################POSTS

post1 = Post.create(title: "Here's an adorable puppy you can stare at so you don't have to think about the triviality of your contribution to society",
	author_id: 1, image: puppy, image_id: puppy.id,
  categories: [Category.find(5)]
)

post2 = Post.create(title: "Let's all just upvote this photo of a kitten that I just googled so I can sleep easy knowing that I have plenty of internet points",
	author_id: 4, image: kitten, image_id: kitten.id,
  categories: [Category.find(5)]
)

post3 = Post.create(title: "This animal's uniqueness is only enhanced by the dearth of any real wildlife in my immediate vicinity!",
	author_id: 4, image: tenerec, image_id: tenerec.id,
  categories: [Category.find(5), Category.find(4), Category.find(2)]
)

post4 = Post.create(title: "Raising awareness is a crucial part of any conservation effort",
	author_id: 4, image: condor, image_id: condor.id,
  categories: [Category.find(2), Category.find(4), Category.find(6)]
)

post5 = Post.create(title: "Charismatic megafauna always get the upvotes.",
	author_id: 5, image: sloth, image_id: sloth.id,
  categories: [Category.find(1), Category.find(5), Category.find(6)]
)

post6 = Post.create(title: "My studies confirm that users desire short loops of silent low-quality video featuring animals acting silly.",
	author_id: 6, image: dog_gif, image_id: dog_gif.id,
  categories: [Category.find(1), Category.find(5)]
)

post7 = Post.create(title: "This joke features references to media that this userbase is fond of.",
	author_id: 7, image: harry_force, image_id: harry_force.id,
  categories: [Category.find(1), Category.find(2)]
)

post8 = Post.create(title: "Please support your internet community's artists!",
	author_id: 4, image: unicorn_art, image_id: unicorn_art.id,
  categories: [Category.find(3), Category.find(6)]
)

post9 = Post.create(title: "The voices in your head are actually useful here.",
	author_id: 5, image: office_gif, image_id: office_gif.id,
  categories: [Category.find(1), Category.find(2)]
)

post10 = Post.create(title: "I don't know why I posted this here... Move along...",
	author_id: 3, image: cezanne, image_id: cezanne.id,
  categories: [Category.find(3)]
)

post11 = Post.create(title: "You're less likely to feel your life slipping between your fingers if you think you've learned something",
	author_id: 6, image: infograph, image_id: infograph.id,
  categories: [Category.find(2), Category.find(4)]
)

post12 = Post.create(title: "There's no way that bemoaning a minor grievance common to most people in a developed nation can get downvoted on the internet!",
	author_id: 7, image: first_world_meme, image_id: first_world_meme.id,
  categories: [Category.find(1)]
)

post13 = Post.create(title: "Stare long enough and you might forget that you're just wasting time",
	author_id: 5, image: earth_porn1, image_id: earth_porn1.id,
  categories: [Category.find(3), Category.find(6)]
)

post14 = Post.create(title: "Maybe one day I'll travel there. Probably not, though.",
	author_id: 3, image: earth_porn2, image_id: earth_porn2.id,
  categories: [Category.find(3), Category.find(6)]
)

post15 = Post.create(title: "It carries more meaning because a famous person said it",
	author_id: 5, image: bill_gates, image_id: bill_gates.id,
  categories: [Category.find(4), Category.find(6)]
)

post16 = Post.create(title: "Believe it!",
	author_id: 2, image: motivational, image_id: motivational.id,
  categories: [Category.find(1), Category.find(4)]
)

##################COMMENTS

comment1 = Comment.create(author_id: 1,
	body: "It is actually pretty cute.",
	commentable_id: 1, commentable_type: "Post"
)

comment2 = Comment.create(author_id: 6,
	body: "They're only cute because we've domesticated them to retain their juvenile features.",
	commentable_id: 1, commentable_type: "Post"
)

comment3 = Comment.create(author_id: 7,
	body: "At least you're honest. Enjoy the upvote...",
	commentable_id: 2, commentable_type: "Post"
)

comment4 = Comment.create(author_id: 3,
	body: "Pikachu?",
	commentable_id: 3, commentable_type: "Post"
)

comment5 = Comment.create(author_id: 4,
	body: "It's a tenerec, duh.",
	commentable_id: 3, commentable_type: "Post"
)

comment6 = Comment.create(author_id: 7,
	body: "Looks like a giant turkey. I'd eat it.",
	commentable_id: 4, commentable_type: "Post"
)

comment7 = Comment.create(author_id: 7,
	body: "Slooooo",
	commentable_id: 5, commentable_type: "Post"
)

comment8 = Comment.create(author_id: 5,
	body: "oooooooooo",
	commentable_id: 5, commentable_type: "Post"
)

comment9 = Comment.create(author_id: 6,
	body: "ooooooooth...",
	commentable_id: 5, commentable_type: "Post"
)

comment10 = Comment.create(author_id: 5,
	body: "Wait, this is from zelda, right?",
	commentable_id: 7, commentable_type: "Post"
)

comment11 = Comment.create(author_id: 3,
	body: "Generic offensive comment",
	commentable_id: 8, commentable_type: "Post"
)

comment12 = Comment.create(author_id: 4,
	body: "Generic defensive reply",
	commentable_id: 8, commentable_type: "Post"
)

comment13 = Comment.create(author_id: 7,
	body: "YES",
	commentable_id: 9, commentable_type: "Post"
)

comment14 = Comment.create(author_id: 7,
	body: "YEEEEEEEES",
	commentable_id: 9, commentable_type: "Post"
)

comment15 = Comment.create(author_id: 5,
	body: "Informative!",
	commentable_id: 11, commentable_type: "Post"
)

comment16 = Comment.create(author_id: 1,
	body: "So true.",
	commentable_id: 12, commentable_type: "Post"
)

comment17 = Comment.create(author_id: 4,
	body: "Gorgeous",
	commentable_id: 13, commentable_type: "Post"
)

comment18 = Comment.create(author_id: 3,
	body: "Pretty pretty.",
	commentable_id: 13, commentable_type: "Post"
)

comment19 = Comment.create(author_id: 7,
	body: "So laziness = money?",
	commentable_id: 15, commentable_type: "Post"
)

#################VOTES

vote_1 = Vote.create(
	user_id: 1, post_id: 1, vote_score: 1
)

vote_2 = Vote.create(
	user_id: 7, post_id: 1, vote_score: 1
)

vote_3 = Vote.create(
	user_id: 3, post_id: 1, vote_score: 1
)

vote_4 = Vote.create(
	user_id: 4, post_id: 1, vote_score: 1
)

vote_5 = Vote.create(
	user_id: 5, post_id: 1, vote_score: 1
)

vote_6 = Vote.create(
	user_id: 6, post_id: 2, vote_score: 1
)

vote_7 = Vote.create(
	user_id: 1, post_id: 4, vote_score: -1
)

vote_8 = Vote.create(
	user_id: 3, post_id: 4, vote_score: -1
)

vote_9 = Vote.create(
	user_id: 5, post_id: 5, vote_score: -1
)

vote_10 = Vote.create(
	user_id: 7, post_id: 5, vote_score: 1
)

vote_11 = Vote.create(
	user_id: 6, post_id: 5, vote_score: 1
)

vote_12 = Vote.create(
	user_id: 1, post_id: 5, vote_score: 1
)

vote_13 = Vote.create(
	user_id: 4, post_id: 5, vote_score: 1
)

vote_14 = Vote.create(
	user_id: 1, post_id: 6, vote_score: 1
)

vote_15 = Vote.create(
	user_id: 3, post_id: 6, vote_score: 1
)

vote_16 = Vote.create(
	user_id: 7, post_id: 6, vote_score: -1
)

vote_17 = Vote.create(
	user_id: 4, post_id: 7, vote_score: 1
)

vote_18 = Vote.create(
	user_id: 5, post_id: 7, vote_score: 1
)

vote_19 = Vote.create(
	user_id: 1, post_id: 7, vote_score: 1
)

vote_20 = Vote.create(
	user_id: 3, post_id: 7, vote_score: 1
)

vote_21 = Vote.create(
	user_id: 1, post_id: 8, vote_score: -1
)

vote_22 = Vote.create(
	user_id: 1, post_id: 9, vote_score: 1
)

vote_23 = Vote.create(
	user_id: 1, post_id: 10, vote_score: -1
)

vote_24 = Vote.create(
	user_id: 3, post_id: 10, vote_score: -1
)

vote_25 = Vote.create(
	user_id: 5, post_id: 10, vote_score: -1
)

vote_26 = Vote.create(
	user_id: 6, post_id: 10, vote_score: -1
)

vote_27 = Vote.create(
	user_id: 1, post_id: 11, vote_score: -1
)

vote_28 = Vote.create(
	user_id: 1, post_id: 12, vote_score: 1
)

vote_29 = Vote.create(
	user_id: 3, post_id: 12, vote_score: 1
)

vote_30 = Vote.create(
	user_id: 1, post_id: 13, vote_score: 1
)

vote_31 = Vote.create(
	user_id: 7, post_id: 15, vote_score: -1
)

vote_32 = Vote.create(
	user_id: 1, post_id: 16, vote_score: 1
)

vote_33 = Vote.create(
	user_id: 3, post_id: 16, vote_score: 1
)

vote_34 = Vote.create(
	user_id: 4, post_id: 16, vote_score: 1
)

vote_35 = Vote.create(
	user_id: 7, post_id: 16, vote_score: 1
)

vote_36 = Vote.create(
	user_id: 6, post_id: 1, vote_score: 1
)

vote_37 = Vote.create(
	user_id: 5, post_id: 16, vote_score: 1
)

# Extra guest seeds:

guest_comment = Comment.create(author_id: 2,
	body: "No?",
	commentable_id: 9, commentable_type: "Post"
)