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

ActiveRecord::Schema.define(version: 20140601003711) do

  create_table "people", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.date     "dob"
    t.string   "sex"
    t.boolean  "has_privacy_concerns"
    t.string   "mobile"
    t.string   "email"
    t.string   "current_contact_name"
    t.string   "current_contact_phone"
    t.string   "current_contact_email"
    t.text     "current_contact_description"
    t.string   "injury_description"
    t.string   "transport"
    t.string   "house_status"
    t.string   "address"
    t.string   "suburb"
    t.string   "state"
    t.string   "postcode"
    t.text     "others_at_address"
    t.text     "pet_details"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "uuid"
  end

  add_index "people", ["uuid"], name: "index_people_on_uuid"

  create_table "service_providers", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
