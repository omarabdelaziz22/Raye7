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

ActiveRecord::Schema.define(version: 2018_11_27_174333) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "pickups", force: :cascade do |t|
    t.bigint "passenger_id"
    t.bigint "source_id"
    t.bigint "destination_id"
    t.datetime "departure_t"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["destination_id"], name: "index_pickups_on_destination_id"
    t.index ["passenger_id"], name: "index_pickups_on_passenger_id"
    t.index ["source_id"], name: "index_pickups_on_source_id"
  end

  create_table "places", force: :cascade do |t|
    t.string "name"
    t.string "longitude"
    t.string "latitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["longitude", "latitude"], name: "index_places_on_longitude_and_latitude", unique: true
    t.index ["name"], name: "index_places_on_name", unique: true
  end

  create_table "trips", force: :cascade do |t|
    t.bigint "driver_id"
    t.bigint "source_id"
    t.bigint "destination_id"
    t.datetime "departure_t"
    t.integer "seats"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["destination_id"], name: "index_trips_on_destination_id"
    t.index ["driver_id"], name: "index_trips_on_driver_id"
    t.index ["source_id"], name: "index_trips_on_source_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.string "phone"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["phone"], name: "index_users_on_phone", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "pickups", "places", column: "destination_id"
  add_foreign_key "pickups", "places", column: "source_id"
  add_foreign_key "pickups", "users", column: "passenger_id"
  add_foreign_key "trips", "places", column: "destination_id"
  add_foreign_key "trips", "places", column: "source_id"
  add_foreign_key "trips", "users", column: "driver_id"
end
