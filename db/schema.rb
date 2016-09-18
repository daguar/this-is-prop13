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

ActiveRecord::Schema.define(version: 20160918230415) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "tax_roll_properties", force: :cascade do |t|
    t.string   "location_address"
    t.float    "assessed_improvement_value"
    t.float    "assessed_land_value"
    t.float    "assessed_fixtures_value"
    t.integer  "zip_code"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "zillow_properties", force: :cascade do |t|
    t.string   "street_address"
    t.string   "city"
    t.integer  "zip_code"
    t.float    "zestimate"
    t.integer  "tax_roll_property_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "zillow_properties", ["tax_roll_property_id"], name: "index_zillow_properties_on_tax_roll_property_id", using: :btree

  add_foreign_key "zillow_properties", "tax_roll_properties"
end
