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

ActiveRecord::Schema.define(version: 20150429013107) do

  create_table "addresses", force: :cascade do |t|
    t.string   "field1",         limit: 255
    t.string   "field2",         limit: 255
    t.string   "field3",         limit: 255
    t.string   "field4",         limit: 255
    t.string   "city",           limit: 255
    t.string   "state",          limit: 255
    t.string   "postalcode",     limit: 255
    t.integer  "user_id",        limit: 4
    t.integer  "created_by",     limit: 4
    t.integer  "updated_by",     limit: 4
    t.integer  "deactivated_by", limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "addresses", ["user_id"], name: "index_addresses_on_user_id", using: :btree

  create_table "carts", force: :cascade do |t|
    t.integer  "quantity",   limit: 4
    t.integer  "product_id", limit: 4
    t.integer  "user_id",    limit: 4
    t.integer  "updated_by", limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "carts", ["product_id"], name: "index_carts_on_product_id", using: :btree
  add_index "carts", ["user_id"], name: "index_carts_on_user_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name",           limit: 255
    t.text     "description",    limit: 65535
    t.boolean  "active",         limit: 1
    t.integer  "created_by",     limit: 4
    t.integer  "updated_by",     limit: 4
    t.integer  "deactivated_by", limit: 4
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",    limit: 255, null: false
    t.string   "data_content_type", limit: 255
    t.integer  "data_file_size",    limit: 4
    t.integer  "assetable_id",      limit: 4
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width",             limit: 4
    t.integer  "height",            limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "menus", force: :cascade do |t|
    t.string   "name",           limit: 255
    t.string   "icon",           limit: 255
    t.boolean  "active",         limit: 1
    t.integer  "created_by",     limit: 4
    t.integer  "updated_by",     limit: 4
    t.integer  "deactivated_by", limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "orders", force: :cascade do |t|
    t.float    "freight_price",   limit: 24
    t.integer  "freight_type",    limit: 4
    t.integer  "status",          limit: 4
    t.string   "delivery_field1", limit: 255
    t.string   "delivery_field2", limit: 255
    t.string   "delivery_field3", limit: 255
    t.string   "delivery_field4", limit: 255
    t.string   "delivery_city",   limit: 255
    t.string   "delivery_state",  limit: 255
    t.integer  "user_id",         limit: 4
    t.integer  "updated_by",      limit: 4
    t.integer  "deactivated_by",  limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "pages", force: :cascade do |t|
    t.string   "title",          limit: 255
    t.text     "description",    limit: 65535
    t.boolean  "active",         limit: 1
    t.integer  "created_by",     limit: 4
    t.integer  "updated_by",     limit: 4
    t.integer  "deactivated_by", limit: 4
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "product_orders", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.decimal  "price",                     precision: 10
    t.text     "description", limit: 65535
    t.integer  "quantity",    limit: 4
    t.integer  "order_id",    limit: 4
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  add_index "product_orders", ["order_id"], name: "index_product_orders_on_order_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "name",             limit: 255
    t.decimal  "price",                          precision: 8, scale: 2
    t.string   "cover",            limit: 255
    t.string   "publishing_house", limit: 255
    t.string   "author",           limit: 255
    t.integer  "number_pages",     limit: 4
    t.text     "description",      limit: 65535
    t.integer  "stock",            limit: 4
    t.boolean  "active",           limit: 1
    t.integer  "category_id",      limit: 4
    t.integer  "subcategory_id",   limit: 4
    t.integer  "user_id",          limit: 4
    t.integer  "created_by",       limit: 4
    t.integer  "updated_by",       limit: 4
    t.integer  "deactivated_by",   limit: 4
    t.datetime "created_at",                                             null: false
    t.datetime "updated_at",                                             null: false
  end

  add_index "products", ["category_id"], name: "index_products_on_category_id", using: :btree
  add_index "products", ["subcategory_id"], name: "index_products_on_subcategory_id", using: :btree
  add_index "products", ["user_id"], name: "index_products_on_user_id", using: :btree

  create_table "subcategories", force: :cascade do |t|
    t.string   "name",           limit: 255
    t.text     "description",    limit: 65535
    t.boolean  "active",         limit: 1
    t.integer  "category_id",    limit: 4
    t.integer  "created_by",     limit: 4
    t.integer  "updated_by",     limit: 4
    t.integer  "deactivated_by", limit: 4
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "subcategories", ["category_id"], name: "index_subcategories_on_category_id", using: :btree

  create_table "submenus", force: :cascade do |t|
    t.string   "name",           limit: 255
    t.string   "route",          limit: 255
    t.boolean  "active",         limit: 1
    t.integer  "menu_id",        limit: 4
    t.integer  "created_by",     limit: 4
    t.integer  "updated_by",     limit: 4
    t.integer  "deactivated_by", limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "submenus", ["menu_id"], name: "index_submenus_on_menu_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "firstname",              limit: 255
    t.string   "lastname",               limit: 255
    t.string   "phone1",                 limit: 255
    t.string   "phone2",                 limit: 255
    t.string   "doc1",                   limit: 255
    t.string   "doc2",                   limit: 255
    t.string   "avatar",                 limit: 255
    t.boolean  "active",                 limit: 1
    t.integer  "group",                  limit: 4
    t.integer  "created_by",             limit: 4
    t.integer  "updated_by",             limit: 4
    t.integer  "deactivated_by",         limit: 4
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "addresses", "users"
  add_foreign_key "carts", "products"
  add_foreign_key "carts", "users"
  add_foreign_key "orders", "users"
  add_foreign_key "product_orders", "orders"
  add_foreign_key "products", "categories"
  add_foreign_key "products", "subcategories"
  add_foreign_key "products", "users"
  add_foreign_key "subcategories", "categories"
  add_foreign_key "submenus", "menus"
end
