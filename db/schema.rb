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

ActiveRecord::Schema.define(version: 2018_02_04_120153) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "administrators", force: :cascade do |t|
    t.string "email", null: false
    t.string "name"
    t.string "security_token"
    t.datetime "security_token_stored_at"
    t.datetime "inactivated_at"
    t.string "phone"
    t.string "address"
    t.string "postal_code"
    t.date "birthdate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "department_id", null: false
    t.index ["email"], name: "index_administrators_on_email"
    t.index ["phone"], name: "index_administrators_on_phone"
  end

  create_table "asset_types", force: :cascade do |t|
    t.string "name", limit: 128, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string "email", limit: 128, null: false
    t.string "name", limit: 64, null: false
    t.string "phone", limit: 32
    t.string "address", limit: 64, null: false
    t.string "postal_code", limit: 10, null: false
    t.date "birthdate", null: false
    t.binary "image_content"
    t.string "image_content_type", limit: 64
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "parental_approval"
    t.boolean "verified", null: false
    t.index ["email"], name: "index_customers_on_email"
    t.index ["phone"], name: "index_customers_on_phone"
  end

  create_table "departments", force: :cascade do |t|
    t.string "name", limit: 32, null: false
    t.string "domain", limit: 32, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["domain"], name: "index_departments_on_domain"
    t.index ["name"], name: "index_departments_on_name"
  end

  create_table "loans", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.bigint "asset_type_id", null: false
    t.integer "quantity"
    t.datetime "returned_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["asset_type_id"], name: "index_loans_on_asset_type_id"
    t.index ["customer_id"], name: "index_loans_on_customer_id"
  end

  add_foreign_key "loans", "asset_types"
  add_foreign_key "loans", "customers"
end
