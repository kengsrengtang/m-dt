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

ActiveRecord::Schema.define(version: 20160131231741) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "additional_rates", force: :cascade do |t|
    t.integer  "price"
    t.integer  "detail_option_id"
    t.integer  "additional_service_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "additional_rates", ["additional_service_id"], name: "index_additional_rates_on_additional_service_id", using: :btree
  add_index "additional_rates", ["detail_option_id"], name: "index_additional_rates_on_detail_option_id", using: :btree

  create_table "additional_services", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "detail_options", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "detail_services", force: :cascade do |t|
    t.integer  "service_id"
    t.integer  "detail_option_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "detail_services", ["detail_option_id"], name: "index_detail_services_on_detail_option_id", using: :btree
  add_index "detail_services", ["service_id"], name: "index_detail_services_on_service_id", using: :btree

  create_table "models", force: :cascade do |t|
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
  end

  add_index "models", ["email"], name: "index_models_on_email", unique: true, using: :btree
  add_index "models", ["reset_password_token"], name: "index_models_on_reset_password_token", unique: true, using: :btree

  create_table "rates", force: :cascade do |t|
    t.integer  "price"
    t.integer  "vehicle_size_id"
    t.integer  "detail_option_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "rates", ["detail_option_id"], name: "index_rates_on_detail_option_id", using: :btree
  add_index "rates", ["vehicle_size_id"], name: "index_rates_on_vehicle_size_id", using: :btree

  create_table "reservations", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.string   "city"
    t.string   "company_name"
    t.datetime "res_date"
    t.time     "time"
    t.text     "special_need"
    t.text     "vehicle_info"
    t.string   "status"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "email"
    t.text     "selected_detail_option"
    t.text     "selected_vehicle_size"
    t.text     "selected_additional_service"
    t.integer  "price"
    t.text     "comment"
  end

  create_table "services", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "vehicle_sizes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
