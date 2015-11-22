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

ActiveRecord::Schema.define(version: 20151122171648) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "quotes", force: :cascade do |t|
    t.decimal  "amount"
    t.text     "note"
    t.integer  "service_request_id"
    t.integer  "user_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "status"
  end

  add_index "quotes", ["service_request_id"], name: "index_quotes_on_service_request_id", using: :btree
  add_index "quotes", ["user_id"], name: "index_quotes_on_user_id", using: :btree

  create_table "service_request_services", force: :cascade do |t|
    t.integer  "service_request_id"
    t.integer  "service_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "service_request_services", ["service_id"], name: "index_service_request_services_on_service_id", using: :btree
  add_index "service_request_services", ["service_request_id"], name: "index_service_request_services_on_service_request_id", using: :btree

  create_table "service_requests", force: :cascade do |t|
    t.string   "additional_notes"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "user_id"
    t.integer  "users_id"
    t.string   "image"
    t.string   "status"
  end

  add_index "service_requests", ["users_id"], name: "index_service_requests_on_users_id", using: :btree

  create_table "services", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",                      null: false
    t.string   "last_name",                       null: false
    t.string   "email",                           null: false
    t.string   "password_digest",                 null: false
    t.string   "street_one",                      null: false
    t.string   "street_two"
    t.string   "state",                           null: false
    t.string   "zip",                             null: false
    t.string   "phone",                           null: false
    t.boolean  "is_provider",     default: false
    t.string   "company_name"
    t.string   "company_desc"
    t.string   "business_logo"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "image"
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree

  add_foreign_key "quotes", "service_requests"
  add_foreign_key "quotes", "users"
  add_foreign_key "service_request_services", "service_requests"
  add_foreign_key "service_request_services", "services"
  add_foreign_key "service_requests", "users"
end
