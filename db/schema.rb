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

ActiveRecord::Schema.define(version: 20170619150641) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "course_id"
    t.datetime "date"
    t.string   "status"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["course_id"], name: "index_appointments_on_course_id", using: :btree
    t.index ["user_id"], name: "index_appointments_on_user_id", using: :btree
  end

  create_table "courses", force: :cascade do |t|
    t.integer  "establishment_id"
    t.string   "title"
    t.string   "category"
    t.float    "price"
    t.text     "description"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["establishment_id"], name: "index_courses_on_establishment_id", using: :btree
  end

  create_table "establishments", force: :cascade do |t|
    t.integer  "user_id"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "street"
    t.integer  "postal_code"
    t.string   "city"
    t.string   "country"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["user_id"], name: "index_establishments_on_user_id", using: :btree
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "appointment_id"
    t.integer  "course_id"
    t.text     "content"
    t.integer  "stars"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["appointment_id"], name: "index_reviews_on_appointment_id", using: :btree
    t.index ["course_id"], name: "index_reviews_on_course_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "appointments", "courses"
  add_foreign_key "appointments", "users"
  add_foreign_key "courses", "establishments"
  add_foreign_key "establishments", "users"
  add_foreign_key "reviews", "appointments"
  add_foreign_key "reviews", "courses"
end
