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

ActiveRecord::Schema.define(version: 20140918124100) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "algo_types", force: true do |t|
    t.string "name"
  end

  create_table "comments", force: true do |t|
    t.integer  "commentable_id",   default: 0
    t.string   "commentable_type"
    t.string   "title"
    t.text     "body"
    t.string   "subject"
    t.integer  "user_id",          default: 0, null: false
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["commentable_id", "commentable_type"], name: "index_comments_on_commentable_id_and_commentable_type", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "configurations", force: true do |t|
    t.string   "nick"
    t.integer  "hw_type_id"
    t.string   "hw_name"
    t.string   "mb"
    t.string   "driver"
    t.string   "miner"
    t.text     "config"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "algo_type_id"
    t.decimal  "hashrate"
    t.string   "miner_pic"
    t.string   "gpuz_pic"
    t.boolean  "published"
    t.integer  "hash_speed_id"
  end

  create_table "hash_speeds", force: true do |t|
    t.string   "speed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hw_types", force: true do |t|
    t.string "name"
  end

  create_table "rigs", force: true do |t|
    t.string   "name"
    t.string   "photo"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: ""
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "nick",                                null: false
    t.integer  "role_id"
  end

  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
