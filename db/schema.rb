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

ActiveRecord::Schema.define(version: 20151007221516) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "timeslot_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.date     "booking_date"
  end

  add_index "bookings", ["user_id", "timeslot_id", "booking_date"], name: "index_bookings_on_user_id_and_timeslot_id_and_booking_date", unique: true, using: :btree

  create_table "instructors", force: :cascade do |t|
    t.string   "name"
    t.string   "about"
    t.integer  "studio_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "studio_classes", force: :cascade do |t|
    t.integer  "studio_id"
    t.string   "name"
    t.text     "description"
    t.integer  "points"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "instructor_name"
    t.integer  "instructor_id"
  end

  create_table "studios", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.string   "zipcode"
    t.string   "phone"
    t.string   "address1"
    t.string   "address2"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.string   "studio_name"
    t.float    "latitude"
    t.float    "longitude"
  end

  add_index "studios", ["email"], name: "index_studios_on_email", unique: true, using: :btree
  add_index "studios", ["reset_password_token"], name: "index_studios_on_reset_password_token", unique: true, using: :btree

  create_table "timeslots", force: :cascade do |t|
    t.text     "days",              default: [],              array: true
    t.time     "start_time"
    t.integer  "duration"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "capacity",          default: 1
    t.integer  "scheduleable_id"
    t.string   "scheduleable_type"
  end

  add_index "timeslots", ["scheduleable_type", "scheduleable_id"], name: "index_timeslots_on_scheduleable_type_and_scheduleable_id", using: :btree

  create_table "trainer_classes", force: :cascade do |t|
    t.integer  "trainer_id"
    t.string   "name"
    t.text     "description"
    t.boolean  "semiprivate", default: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "points"
  end

  create_table "trainers", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.string   "zipcode"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.float    "latitude"
    t.float    "longitude"
    t.text     "about"
    t.string   "phone"
  end

  add_index "trainers", ["email"], name: "index_trainers_on_email", unique: true, using: :btree
  add_index "trainers", ["reset_password_token"], name: "index_trainers_on_reset_password_token", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.string   "zipcode"
    t.integer  "points",                 default: 0
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
