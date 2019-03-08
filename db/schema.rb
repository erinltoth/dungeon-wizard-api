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

ActiveRecord::Schema.define(version: 2019_03_08_003253) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "campaigns", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id"
    t.string "description"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "exp_level"
    t.string "playing_style"
    t.integer "player_limit"
    t.text "synopsis"
    t.index ["user_id"], name: "index_campaigns_on_user_id"
  end

  create_table "join_requests", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "campaign_id"
    t.string "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "player_confirm"
    t.string "dm_confirm"
    t.index ["campaign_id"], name: "index_join_requests_on_campaign_id"
    t.index ["user_id"], name: "index_join_requests_on_user_id"
  end

  create_table "user_campaigns", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "campaign_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campaign_id"], name: "index_user_campaigns_on_campaign_id"
    t.index ["user_id"], name: "index_user_campaigns_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password"
    t.string "playing_style"
    t.string "exp_level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "campaigns", "users"
  add_foreign_key "join_requests", "campaigns"
  add_foreign_key "join_requests", "users"
  add_foreign_key "user_campaigns", "campaigns"
  add_foreign_key "user_campaigns", "users"
end
