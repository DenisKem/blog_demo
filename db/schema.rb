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

ActiveRecord::Schema.define(version: 2018_05_21_052130) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "author_ips", force: :cascade do |t|
    t.string "ip", null: false
    t.string "logins", default: [], null: false, array: true
    t.integer "logins_count", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.integer "author_id", null: false
    t.text "content", null: false
    t.string "author_ip", null: false
    t.string "title", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "average_rate", default: 0, null: false
    t.index ["author_id"], name: "index_posts_on_author_id"
  end

  create_table "rates", force: :cascade do |t|
    t.integer "post_id", null: false
    t.integer "value", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_rates_on_post_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "login", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["login"], name: "index_users_on_login", unique: true
  end

  add_foreign_key "posts", "users", column: "author_id"
  add_foreign_key "rates", "posts"
end
