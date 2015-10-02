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

ActiveRecord::Schema.define(version: 20150826185241) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "commendations", force: :cascade do |t|
    t.string   "mail"
    t.string   "product_id"
    t.string   "product_title"
    t.float    "product_price"
    t.string   "product_img"
    t.text     "product_description"
    t.string   "url"
    t.string   "customer"
    t.integer  "customer_id"
    t.text     "comment"
    t.integer  "shop_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "commendations", ["customer_id", "shop_id"], name: "index_commendations_on_customer_id_and_shop_id", using: :btree
  add_index "commendations", ["customer_id"], name: "index_commendations_on_customer_id", using: :btree
  add_index "commendations", ["product_id", "shop_id"], name: "index_commendations_on_product_id_and_shop_id", using: :btree
  add_index "commendations", ["product_id"], name: "index_commendations_on_product_id", using: :btree
  add_index "commendations", ["shop_id"], name: "index_commendations_on_shop_id", using: :btree

  create_table "shops", force: :cascade do |t|
    t.string   "shopify_domain", null: false
    t.string   "shopify_token",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "shops", ["shopify_domain"], name: "index_shops_on_shopify_domain", unique: true, using: :btree

end
