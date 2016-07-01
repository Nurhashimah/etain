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

ActiveRecord::Schema.define(version: 20160701075406) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendances", force: true do |t|
    t.integer  "schedule_id"
    t.integer  "customer_id"
    t.boolean  "attended"
    t.datetime "taken_on"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bookings", force: true do |t|
    t.string   "code"
    t.integer  "schedule_id"
    t.integer  "customer_id"
    t.integer  "warranty_id"
    t.string   "status"
    t.integer  "user_id"
    t.integer  "college_id"
    t.string   "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "companies", force: true do |t|
    t.string   "company_code"
    t.string   "name"
    t.text     "address"
    t.string   "phone"
    t.string   "email"
    t.string   "fax"
    t.integer  "user_id"
    t.integer  "college_id"
    t.string   "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "courses", force: true do |t|
    t.string   "code"
    t.string   "category"
    t.string   "topic"
    t.string   "description"
    t.decimal  "fee"
    t.integer  "user_id"
    t.integer  "college_id"
    t.string   "data"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "duration"
    t.string   "duration_type"
    t.string   "details"
  end

  create_table "customers", force: true do |t|
    t.string   "id_no"
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.boolean  "corporate"
    t.integer  "company_id"
    t.integer  "user_id"
    t.integer  "college_id"
    t.string   "data"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "position"
  end

  create_table "customers_schedules", id: false, force: true do |t|
    t.integer "customer_id"
    t.integer "schedule_id"
  end

  create_table "lecturers", force: true do |t|
    t.string   "name"
    t.text     "details"
    t.decimal  "rate"
    t.integer  "user_id"
    t.integer  "college_id"
    t.string   "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lecturers_schedules", id: false, force: true do |t|
    t.integer "lecturer_id"
    t.integer "schedule_id"
  end

  create_table "locations", force: true do |t|
    t.integer  "region"
    t.string   "name"
    t.text     "description"
    t.integer  "user_id"
    t.integer  "college_id"
    t.string   "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payments", force: true do |t|
    t.integer  "booking_id"
    t.integer  "customer_id"
    t.string   "method"
    t.string   "auth_code"
    t.decimal  "amount"
    t.integer  "confirmed_by"
    t.datetime "confirmed_on"
    t.string   "status"
    t.integer  "user_id"
    t.integer  "college_id"
    t.string   "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schedules", force: true do |t|
    t.integer  "course_id"
    t.datetime "start_on"
    t.integer  "location_id"
    t.integer  "lecturer_id"
    t.integer  "max_people"
    t.string   "status"
    t.integer  "user_id"
    t.integer  "college_id"
    t.string   "data"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "end_on"
    t.string   "departments"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
