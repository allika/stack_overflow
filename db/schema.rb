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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120613152213) do

  create_table "categories", :force => true do |t|
    t.string   "name",       :limit => 200
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "categories", ["name"], :name => "index_categories_on_name"

  create_table "comments", :force => true do |t|
    t.integer  "theme_id"
    t.integer  "user_id"
    t.text     "body"
    t.integer  "rating",     :default => 0,     :null => false
    t.boolean  "top_level",  :default => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "comments", ["theme_id", "user_id", "rating"], :name => "index_comments_on_theme_id_and_user_id_and_rating"

  create_table "estimations", :force => true do |t|
    t.integer  "comment_id"
    t.integer  "user_id"
    t.boolean  "plus",       :default => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "estimations", ["comment_id", "user_id"], :name => "index_estimations_on_comment_id_and_user_id"

  create_table "themes", :force => true do |t|
    t.integer  "category_id"
    t.integer  "user_id"
    t.string   "name",        :limit => 200
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  add_index "themes", ["category_id", "user_id", "name"], :name => "index_themes_on_category_id_and_user_id_and_name"

  create_table "users", :force => true do |t|
    t.string   "first_name",      :limit => 25
    t.string   "last_name",       :limit => 35
    t.string   "username",        :limit => 35
    t.string   "email",           :limit => 60, :default => "", :null => false
    t.string   "hashed_password", :limit => 40
    t.string   "salt",            :limit => 40
    t.datetime "created_at",                                    :null => false
    t.datetime "updated_at",                                    :null => false
  end

  add_index "users", ["username"], :name => "index_users_on_username"

end
