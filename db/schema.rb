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

ActiveRecord::Schema.define(version: 20140326182527) do

  create_table "class_details", force: true do |t|
    t.string   "class_name"
    t.float    "score"
    t.integer  "repository_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lines"
    t.integer  "linesOfCode"
    t.float    "average"
    t.integer  "method_count"
    t.float    "lines_per_method"
  end

  add_index "class_details", ["repository_id"], name: "index_class_details_on_repository_id"

  create_table "repositories", force: true do |t|
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "repositories", ["url"], name: "index_repositories_on_url", unique: true

end
