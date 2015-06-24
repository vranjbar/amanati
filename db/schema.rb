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

ActiveRecord::Schema.define(version: 20150624130806) do

  create_table "categories", force: true do |t|
    t.string   "name",       limit: 100, default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.integer  "user_id"
    t.integer  "product_id"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["product_id"], name: "index_comments_on_product_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "products", force: true do |t|
    t.string   "name",         limit: 75
    t.integer  "category_id"
    t.integer  "user_id"
    t.text     "description"
    t.integer  "price",                    default: 0,  null: false
    t.string   "city",         limit: 20
    t.string   "address",      limit: 150
    t.string   "phone_number", limit: 15
    t.string   "email",                    default: "", null: false
    t.integer  "rank"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "products", ["category_id"], name: "index_products_on_category_id", using: :btree
  add_index "products", ["user_id"], name: "index_products_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name",            limit: 75
    t.string   "user_name",       limit: 25,  default: "", null: false
    t.string   "hashed_password", limit: 40,  default: "", null: false
    t.string   "email",                       default: "", null: false
    t.string   "province",        limit: 20
    t.string   "city",            limit: 20
    t.string   "address",         limit: 150
    t.string   "phone_number",    limit: 15
    t.string   "image",           limit: 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
  end

end
