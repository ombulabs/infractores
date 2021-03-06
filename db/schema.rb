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

ActiveRecord::Schema.define(version: 20160229023500) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "evidences", force: :cascade do |t|
    t.integer "infraction_id"
    t.string  "media"
  end

  create_table "infractions", force: :cascade do |t|
    t.string   "tweet_id"
    t.text     "description"
    t.integer  "location_id"
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.boolean  "legitimate",                            default: true
    t.decimal  "lat",         precision: 12, scale: 10,                null: false
    t.decimal  "lon",         precision: 12, scale: 10,                null: false
    t.datetime "reported_at"
  end

  create_table "tweets", id: false, force: :cascade do |t|
    t.string  "id",      null: false
    t.text    "json",    null: false
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "twitter_user_id"
    t.string   "username"
    t.string   "profile_image_url"
    t.string   "name"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "infractions_count", default: 0
  end

  add_index "users", ["username"], name: "index_users_on_username", using: :btree

end
