# TenGigg

[Heroku link][heroku]

[heroku]: http://tengigg.herokuapp.com/

##Technologies
- Single page Backbone app utilizing a RESTful Rails architecture.
- Image join table that resizes images appropriately given their context.
- CompositeView class to prevent memory leaks and dynamically update collections.
- Custom authentication with BCrypt overrides User#password with a salted hash.

## Minimum Viable Product
TenGigg is a social image and gif sharing site inspired by 9gag. Users can:

<!-- This is a Markdown checklist. Use it to keep track of your progress! -->

- [x] Create accounts
- [x] Create sessions (log in)
- [x] View a feed of the posts sorted by vote score or category
- [x] Post content: an image or gif with a title and 1-3 categories
- [x] Comment on posts
- [x] Upvote or downvote posts
- [x] View their account profile
- [x] View a feed of posts that they've posted, commented on, or upvoted.

## Design Docs
* [View Wireframes][views]
* [DB schema][schema]

[views]: ./docs/views.md
[schema]: ./docs/schema.md

## Implementation Timeline

### Phase 1: User Authentication, Public Home Page (~2 days)
I will implement user authentication in Rails based on the practices learned at
App Academy. The main index will be public and eventually display posts, sorted by
popularity or one of the options in the navbar. Log-in is required to submit posts,
comment, or vote. Posts in the index will be displayed in a main-view format; with
a full-size image, popularity and comment stats, but no comments visible.

[Details][phase-one]

### Phase 2: Make New Posts, Categories (~2 days)
Registered users can add new posts, selecting up to 2 categories to post to.
Posts are comprised of a title and a file; a gif, png, or jpeg initially. This file
will be uploaded via Cloudinary. The public main page index can be filtered by category
via drop-down menu.

[Details][phase-two]

### Phase 3: Displaying Single Posts, Comments (~3 days)
Posts can be clicked on to navigate to the show page. The post will be displayed in
full-view format, with its comments underneath the post. Voting can also be performed
here.
[Details][phase-three]

### Phase 4: Voting on Posts and Comments, Posts Sidebar (~1-2 days)
Users can upvote or downvote posts and comments, increasing or decreasing the post or
comment's popularity score. There will be a sidebar with posts displayed in a
thumb-view format, with just a small image and the title, and possibly also comment
and popularity stats. Sidebar will display a random sample of posts.


[Details][phase-four]

### Phase 5: User Account, Post Search (~3 days)
Users can customize their own account to include a picture that will show up next to
their comments, and see lists of posts that they are "engaged" with. Engaged posts are
either authored by the user, commented on by the user, or upvoted by the user. Users
can sort via type of engagement, or view all engaged posts. Users can search for posts
by title, resulting in a list of posts in main-view format; like the main index, but
filtered by search criteria.

[Details][phase-five]

### Future Additions
- [ ] Comment on comments
- [ ] Vote on comments
- [ ] Search for posts by title
- [ ] View other account profiles
- [ ] Infinite scroll
- [ ] Video posts
- [ ] Multiple sessions/session management
- [ ] Toggleable thumb-view or main-view format for search results
- [ ] Typeahead search bar
- [ ] Simple image edit/creation app

[phase-one]: ./docs/phases/phase1.md
[phase-two]: ./docs/phases/phase2.md
[phase-three]: ./docs/phases/phase3.md
[phase-four]: ./docs/phases/phase4.md
[phase-five]: ./docs/phases/phase5.md
