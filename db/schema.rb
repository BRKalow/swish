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

ActiveRecord::Schema.define(version: 20141121022248) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "collections", force: true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.integer  "num_snippets"
    t.integer  "num_likes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "collections", ["user_id"], name: "index_collections_on_user_id", using: :btree

  create_table "collections_snippets", force: true do |t|
    t.integer "snippet_id"
    t.integer "collection_id"
  end

  create_table "comments", force: true do |t|
    t.integer  "user_id"
    t.integer  "snippet_id"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["snippet_id"], name: "index_comments_on_snippet_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "favorite_snippets", force: true do |t|
    t.integer  "user_id"
    t.integer  "snippet_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "favorite_snippets", ["snippet_id"], name: "index_favorite_snippets_on_snippet_id", using: :btree
  add_index "favorite_snippets", ["user_id"], name: "index_favorite_snippets_on_user_id", using: :btree

  create_table "joinings", force: true do |t|
    t.integer  "user_id"
    t.integer  "team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "joinings", ["team_id"], name: "index_joinings_on_team_id", using: :btree
  add_index "joinings", ["user_id"], name: "index_joinings_on_user_id", using: :btree

  create_table "snippets", force: true do |t|
    t.text     "language"
    t.text     "title"
    t.text     "body"
    t.integer  "num_favorites"
    t.integer  "num_views"
    t.integer  "num_comments"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "snippets", ["user_id"], name: "index_snippets_on_user_id", using: :btree

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "snippet_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "taggings", ["snippet_id"], name: "index_taggings_on_snippet_id", using: :btree
  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id", using: :btree

  create_table "tags", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", force: true do |t|
    t.string   "name"
    t.text     "picture"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
