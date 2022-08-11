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

ActiveRecord::Schema.define(version: 2022_08_11_171700) do

  create_table "requests", force: :cascade do |t|
    t.date "request_date"
    t.time "request_start_time"
    t.time "request_end_time"
    t.string "request_location"
    t.string "request_street_address"
    t.string "request_city"
    t.string "request_state"
    t.string "request_country"
    t.integer "request_postal_code"
    t.string "request_parking_location"
    t.string "request_meeting_location"
    t.boolean "request_pet"
    t.string "request_gender_preference"
    t.string "request_comments"
    t.float "request_amount"
    t.string "request_status"
    t.integer "requestor_id"
    t.integer "provider_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "user_type"
    t.string "user_profile_picture"
    t.string "user_first_name"
    t.string "user_last_name"
    t.string "user_street_address"
    t.string "user_city"
    t.string "user_state"
    t.string "user_country"
    t.integer "user_postal_code"
    t.string "user_race"
    t.string "user_comments"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
