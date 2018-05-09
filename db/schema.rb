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

ActiveRecord::Schema.define(version: 20180507134505) do

  create_table "bookings", force: :cascade do |t|
    t.integer "location_id"
    t.integer "seat_id"
    t.integer "timeslot_id"
    t.date "day_to_eat"
    t.boolean "reservation_place"
    t.boolean "status"
    t.integer "action"
    t.string "delivery_type"
    t.string "payment_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "cart_items", force: :cascade do |t|
    t.integer "dish_id"
    t.integer "cart_id"
    t.decimal "price"
    t.integer "quantity", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "booking_id"
    t.index ["booking_id"], name: "index_cart_items_on_booking_id"
  end

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "display_name"
    t.integer "sub_category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dishes", force: :cascade do |t|
    t.string "name"
    t.string "display_name"
    t.string "subtitle"
    t.decimal "price"
    t.text "description"
    t.integer "portion"
    t.integer "serves"
    t.integer "min_qty"
    t.string "tags"
    t.string "image", default: ""
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "location_id"
    t.integer "category_id"
    t.index ["category_id"], name: "index_dishes_on_category_id"
    t.index ["location_id"], name: "index_dishes_on_location_id"
  end

  create_table "districts", force: :cascade do |t|
    t.string "district"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "city_id"
    t.index ["city_id"], name: "index_districts_on_city_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "user_id"
    t.string "target_type"
    t.integer "target_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["target_type", "target_id"], name: "index_likes_on_target_type_and_target_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
    t.string "address"
    t.string "phone"
    t.string "open_time"
    t.text "description"
    t.string "radius"
    t.boolean "status"
    t.integer "sum_rate"
    t.float "rate_avg"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "opening_hours", force: :cascade do |t|
    t.string "day"
    t.time "open"
    t.time "close"
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "location_id"
    t.index ["location_id"], name: "index_opening_hours_on_location_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "user_id"
    t.decimal "total_price"
    t.boolean "status"
    t.date "date_order"
    t.date "date_receipt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.integer "rate_score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "location_id"
    t.integer "user_id"
    t.index ["location_id"], name: "index_reviews_on_location_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "seatings", force: :cascade do |t|
    t.string "seat_name"
    t.integer "location_id"
    t.integer "floor"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stores", force: :cascade do |t|
    t.string "name"
    t.string "logo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "timeslots", force: :cascade do |t|
    t.integer "location_id"
    t.string "name"
    t.string "start"
    t.string "end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "provider"
    t.string "uid"
    t.integer "admin"
    t.string "avatar"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
