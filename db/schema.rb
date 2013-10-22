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

ActiveRecord::Schema.define(version: 20131022112935) do

  create_table "availabilities", force: true do |t|
    t.integer  "participant_id"
    t.integer  "event_date_id"
    t.string   "times"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "availabilities", ["event_date_id"], name: "index_availabilities_on_event_date_id"
  add_index "availabilities", ["participant_id"], name: "index_availabilities_on_participant_id"

  create_table "event_dates", force: true do |t|
    t.integer  "event_id"
    t.string   "times"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "date"
  end

  add_index "event_dates", ["event_id"], name: "index_event_dates_on_event_id"

  create_table "events", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.float    "duration"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "token"
  end

  add_index "events", ["token"], name: "index_events_on_token"

  create_table "participants", force: true do |t|
    t.string   "name"
    t.string   "password_digest"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "participants", ["event_id"], name: "index_participants_on_event_id"

end
