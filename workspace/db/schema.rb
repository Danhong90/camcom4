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

ActiveRecord::Schema.define(version: 20150812175823) do

  create_table "campushashes", force: :cascade do |t|
    t.string   "hash_content"
    t.string   "hash_category"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "posthashrels", force: :cascade do |t|
    t.integer  "campushash_id"
    t.integer  "post_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "posthashrels", ["campushash_id"], name: "index_posthashrels_on_campushash_id"
  add_index "posthashrels", ["post_id"], name: "index_posthashrels_on_post_id"

  create_table "posts", force: :cascade do |t|
    t.string   "post_category"
    t.date     "post_deadline"
    t.string   "post_company"
    t.string   "post_subject"
    t.text     "post_content"
    t.string   "post_image"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "postuserrels", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "post_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "mango",      default: 0
    t.integer  "melon",      default: 0
    t.integer  "tag"
  end

  add_index "postuserrels", ["post_id"], name: "index_postuserrels_on_post_id"
  add_index "postuserrels", ["user_id"], name: "index_postuserrels_on_user_id"

  create_table "userhashrels", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "campushash_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "pick_type"
  end

  add_index "userhashrels", ["campushash_id"], name: "index_userhashrels_on_campushash_id"
  add_index "userhashrels", ["user_id"], name: "index_userhashrels_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["provider"], name: "index_users_on_provider"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["uid"], name: "index_users_on_uid"

end
