# TenGigg

[Heroku link][heroku]

[heroku]: http://www.tengigg.xyz/

##Technologies
- Single page Backbone app utilizing a RESTful Rails architecture.
- Image join table that resizes images appropriately given their context.
- CompositeView class to prevent memory leaks and dynamically update collections.
- Custom authentication with BCrypt overrides User#password with a salted hash.
- Multiple sorting methods handled on the back-end to efficiently organize collections.

##Features
Users who log in can submit original posts, assigning them up to three categories. Posts
can be commented on, and upvoted or downvoted on by other registered users. Posts are
sorted by their "score" on the main index, which goes up or down depending on how they've
been voted on.

Users can visit their own profile to change their username or profile picture that appears
on their comments. They can also review posts that they've interacted with. By default, 
the posts they've submitted and the posts they've commented appear together, but each 
group can be viewed separately, in addition to the posts they've upvoted. Other users'
profiles can be visited, displaying the same information for themselves.

###Future Additions
- Infinite scroll
- Vote on comments
- Typeahead search bar
- Simple image edit/creation app
- Video posts