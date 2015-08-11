# Schema Information

## users
column name     | data type | details
----------------|-----------|-----------------------
id              | integer   | not null, primary key
username        | string    | not null, unique
password_digest | string    | not null
session_token   | string    | not null, unique

## posts
column name | data type | details
------------|-----------|-----------------------
id          | integer   | not null, primary key
author_id   | integer   | not null, foreign key (references users)
title       | string    | not null
categories  | array			| not null, minimum: 1, maximum: 3
popularity  | integer   | not null, default: 0

## comments
column name 		| data type | details
----------------|-----------|-----------------------
id          		| integer   | not null, primary key
commentable_id  | integer   | not null, foreign key (references posts or comments)
commentable_type| string    | not null, (type of association; comment or post)
author_id				| integer		| not null, (references users)
popularity      | integer   | not null, default: 0

## votes
column name  | data type | details
-------------|-----------|-----------------------
id           | integer   | not null, primary key
voteable_id  | integer   | not null, foreign key (references posts or comments)
voteable_type| string    | not null, (type of association; comment or post)
owner_id     | integer   | not null, foreign key (references users)
up_vote      | boolean   | not null, default: true

### categories?