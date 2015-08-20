# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150820162505) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "categories", ["name"], name: "index_categories_on_name", unique: true, using: :btree

  create_table "comments", force: :cascade do |t|
    t.integer  "author_id",        null: false
    t.text     "body",             null: false
    t.integer  "commentable_id",   null: false
    t.string   "commentable_type", null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "comments", ["author_id"], name: "index_comments_on_author_id", using: :btree
  add_index "comments", ["commentable_id"], name: "index_comments_on_commentable_id", using: :btree

  create_table "images", force: :cascade do |t|
    t.string   "url",           null: false
    t.string   "thumbnail_url", null: false
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "post_categories", force: :cascade do |t|
    t.integer  "post_id",     null: false
    t.integer  "category_id", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "post_categories", ["category_id"], name: "index_post_categories_on_category_id", using: :btree
  add_index "post_categories", ["post_id", "category_id"], name: "index_post_categories_on_post_id_and_category_id", using: :btree
  add_index "post_categories", ["post_id"], name: "index_post_categories_on_post_id", using: :btree

  create_table "posts", force: :cascade do |t|
    t.integer  "author_id",              null: false
    t.string   "title",                  null: false
    t.integer  "popularity", default: 0, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "image_id"
  end

  add_index "posts", ["author_id"], name: "index_posts_on_author_id", using: :btree
  add_index "posts", ["image_id"], name: "index_posts_on_image_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username",        null: false
    t.string   "password_digest", null: false
    t.string   "session_token",   null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "image_id"
  end

  add_index "users", ["image_id"], name: "index_users_on_image_id", using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  create_table "votes", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "post_id",    null: false
    t.integer  "vote_score", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "votes", ["user_id", "post_id"], name: "index_votes_on_user_id_and_post_id", unique: true, using: :btree

end
