# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_11_15_060312) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "areas", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "clips", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "house_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["house_id"], name: "index_clips_on_house_id"
    t.index ["user_id", "house_id"], name: "index_clips_on_user_id_and_house_id", unique: true
    t.index ["user_id"], name: "index_clips_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id", null: false
    t.bigint "house_id", null: false
    t.boolean "type", default: false, null: false
    t.integer "star"
    t.string "title"
    t.integer "clean_review"
    t.integer "houserule_review"
    t.integer "location_review"
    t.integer "com_review"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["house_id"], name: "index_comments_on_house_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "facilities", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
  end

  create_table "houses", force: :cascade do |t|
    t.string "name"
    t.string "house_image"
    t.integer "house_rent"
    t.integer "service_fee"
    t.string "station"
    t.integer "access"
    t.integer "house_size"
    t.text "convenience"
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.bigint "area_id"
    t.integer "clips_count", default: 0
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.integer "kitchen"
    t.integer "refrigerator"
    t.integer "laundry"
    t.integer "dryer"
    t.integer "toilet"
    t.integer "shower"
    t.integer "bathroom"
    t.index ["area_id"], name: "index_houses_on_area_id"
    t.index ["user_id"], name: "index_houses_on_user_id"
  end

  create_table "houses_facilities", force: :cascade do |t|
    t.bigint "house_id"
    t.bigint "facility_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["facility_id"], name: "index_houses_facilities_on_facility_id"
    t.index ["house_id"], name: "index_houses_facilities_on_house_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "user_icon"
    t.string "adress"
    t.boolean "experience", default: false, null: false
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "clips", "houses"
  add_foreign_key "clips", "users"
  add_foreign_key "comments", "houses"
  add_foreign_key "comments", "users"
  add_foreign_key "houses", "areas"
  add_foreign_key "houses", "users"
  add_foreign_key "houses_facilities", "facilities"
  add_foreign_key "houses_facilities", "houses"
end
