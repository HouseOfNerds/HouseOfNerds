# frozen_string_literal: true

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

ActiveRecord::Schema.define(version: 20170609220551) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'administrators', force: :cascade do |t|
    t.string 'email', null: false
    t.string 'name'
    t.string 'security_token'
    t.datetime 'security_token_stored_at'
    t.datetime 'inactivated_at'
    t.string 'phone'
    t.string 'address'
    t.string 'postal_code'
    t.date 'birthdate'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['email'], name: 'index_administrators_on_email'
    t.index ['phone'], name: 'index_administrators_on_phone'
  end

  create_table 'customers', force: :cascade do |t|
    t.string 'email', null: false
    t.string 'name'
    t.string 'phone'
    t.string 'address'
    t.string 'postal_code'
    t.date 'birthdate'
    t.binary 'image_content'
    t.binary 'image_content_type'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email'
    t.string 'name'
    t.string 'password_digest'
    t.string 'phone'
    t.string 'address'
    t.string 'postal_code'
    t.date 'birthdate'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end
end
