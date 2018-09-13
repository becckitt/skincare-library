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

ActiveRecord::Schema.define(version: 2018_09_08_045834) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "brands", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  create_table "ingredients", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  create_table "ingredients_products", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "ingredient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ingredient_id"], name: "index_ingredients_products_on_ingredient_id"
    t.index ["product_id"], name: "index_ingredients_products_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.text "comment"
    t.integer "rating"
    t.integer "price_cents", default: 0, null: false
    t.string "price_currency", default: "USD", null: false
    t.text "link"
    t.integer "repurchase"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "product_type"
    t.boolean "wishlist", default: false
    t.integer "brand_id"
    t.integer "user_id"
    t.integer "routine_id"
  end

  create_table "products_routines", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "routine_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_products_routines_on_product_id"
    t.index ["routine_id"], name: "index_products_routines_on_routine_id"
  end

  create_table "products_tags", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_products_tags_on_product_id"
    t.index ["tag_id"], name: "index_products_tags_on_tag_id"
  end

  create_table "routines", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "time_of_day"
  end

  create_table "tags", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.integer "firebase_id"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
