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

ActiveRecord::Schema.define(version: 2020_10_06_134413) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.bigint "province_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["province_id"], name: "index_cities_on_province_id"
  end

  create_table "contracts", force: :cascade do |t|
    t.date "from_date"
    t.date "to_date"
    t.bigint "hotel_id"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hotel_id"], name: "index_contracts_on_hotel_id"
  end

  create_table "facilities", force: :cascade do |t|
    t.string "name"
    t.integer "facility_type", limit: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hotel_facilities", force: :cascade do |t|
    t.bigint "hotel_id"
    t.bigint "facility_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["facility_id"], name: "index_hotel_facilities_on_facility_id"
    t.index ["hotel_id"], name: "index_hotel_facilities_on_hotel_id"
  end

  create_table "hotels", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.text "details"
    t.bigint "city_id"
    t.string "lat"
    t.string "lng"
    t.integer "rank"
    t.integer "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["city_id"], name: "index_hotels_on_city_id"
    t.index ["user_id"], name: "index_hotels_on_user_id"
  end

  create_table "images", force: :cascade do |t|
    t.string "name"
    t.bigint "imageable_id"
    t.string "imageable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["imageable_type", "imageable_id"], name: "index_images_on_imageable_type_and_imageable_id"
  end

  create_table "provinces", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "room_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.bigint "hotel_id"
    t.string "number"
    t.string "check_in_hour"
    t.string "check_out_hour"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "room_type_id"
    t.index ["hotel_id"], name: "index_rooms_on_hotel_id"
    t.index ["room_type_id"], name: "index_rooms_on_room_type_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role"
  end

  add_foreign_key "cities", "provinces"
  add_foreign_key "contracts", "hotels"
  add_foreign_key "hotel_facilities", "facilities"
  add_foreign_key "hotel_facilities", "hotels"
  add_foreign_key "hotels", "cities"
  add_foreign_key "hotels", "users"
  add_foreign_key "rooms", "hotels"
  add_foreign_key "rooms", "room_types"
end
