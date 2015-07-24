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

ActiveRecord::Schema.define(version: 20150724185727) do

  create_table "locations", force: :cascade do |t|
    t.string "country"
    t.string "city"
  end

  create_table "sights", force: :cascade do |t|
    t.string  "sight_name"
    t.string  "category"
    t.string  "feature"
    t.integer "location_id"
  end

  create_table "user_sights", force: :cascade do |t|
    t.integer "user_id"
    t.integer "sight_id"
  end

  create_table "users", force: :cascade do |t|
    t.string  "first_name"
    t.string  "last_name"
    t.string  "username"
    t.string  "email"
    t.string  "password_salt"
    t.string  "password_hash"
    t.integer "location_id"
  end

end
