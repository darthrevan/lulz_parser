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

ActiveRecord::Schema.define(version: 20150922161046) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "champions", force: :cascade do |t|
    t.string  "name"
    t.string  "role"
    t.string  "position"
    t.string  "icon"
    t.integer "lss"
    t.float   "performance"
    t.integer "summoner_id"
  end

  add_index "champions", ["summoner_id"], name: "index_champions_on_summoner_id", using: :btree

  create_table "summoners", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
