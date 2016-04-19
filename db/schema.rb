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

ActiveRecord::Schema.define(version: 20160419182556) do

  create_table "abilities", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "abilities_projects", force: :cascade do |t|
    t.integer  "project_id", limit: 4
    t.integer  "ability_id", limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "assists", force: :cascade do |t|
    t.integer  "task_id",    limit: 4
    t.integer  "user_id",    limit: 4
    t.integer  "status",     limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "friends", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "friend_id",  limit: 4
    t.integer  "status",     limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "interests", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "interests_projects", force: :cascade do |t|
    t.integer  "project_id",  limit: 4
    t.integer  "interest_id", limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "members", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "project_id", limit: 4
    t.integer  "situation",  limit: 4,   default: 0
    t.string   "paper",      limit: 255, default: ""
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string   "description", limit: 255
    t.integer  "topic_id",    limit: 4
    t.integer  "user_id",     limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.string   "description",     limit: 255
    t.string   "avatar",          limit: 255
    t.datetime "date_time_start"
    t.datetime "date_time_end"
    t.string   "place",           limit: 255
    t.integer  "number_members",  limit: 4
    t.integer  "creator_id",      limit: 4
    t.boolean  "visible_project",             default: false
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  create_table "publications", force: :cascade do |t|
    t.string   "description", limit: 255
    t.integer  "user_id",     limit: 4
    t.integer  "project_id",  limit: 4
    t.string   "image",       limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.string   "description", limit: 255
    t.string   "location",    limit: 255
    t.date     "date_start"
    t.date     "date_end"
    t.string   "situation",   limit: 255, default: "0"
    t.integer  "user_id",     limit: 4
    t.integer  "project_id",  limit: 4
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "topics", force: :cascade do |t|
    t.string   "topic_title", limit: 255
    t.string   "description", limit: 255
    t.boolean  "important",               default: false
    t.integer  "project_id",  limit: 4
    t.integer  "user_id",     limit: 4
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  create_table "user_has_abilities", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "ability_id", limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "user_has_interests", force: :cascade do |t|
    t.integer  "user_id",     limit: 4
    t.integer  "interest_id", limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "gender",                 limit: 255
    t.string   "avatar",                 limit: 255
    t.string   "phone",                  limit: 255
    t.date     "date_birthday"
    t.string   "address",                limit: 255
    t.string   "neighborhood",           limit: 255
    t.string   "city",                   limit: 255
    t.string   "state",                  limit: 255
    t.string   "zipcode",                limit: 255
    t.string   "complement",             limit: 255
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.string   "authentication_token",   limit: 255
    t.string   "name",                   limit: 255, default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["authentication_token"], name: "index_users_on_authentication_token", unique: true, using: :btree
  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
