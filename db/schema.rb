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

ActiveRecord::Schema.define(version: 20131114035042) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "histories", force: true do |t|
    t.string   "error_id"
    t.string   "error_class"
    t.string   "file"
    t.integer  "line_number"
    t.string   "project_id"
    t.string   "project_name"
    t.string   "last_notice_id"
    t.string   "last_notice_request_url"
    t.text     "backtrace"
    t.string   "environment"
    t.string   "first_occurred_at"
    t.string   "last_occurred_at"
    t.integer  "times_occurred"
    t.text     "params"
    t.string   "sid"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "message"
  end

  add_index "histories", ["sid"], name: "index_histories_on_sid", using: :btree

end
