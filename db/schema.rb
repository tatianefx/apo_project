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

ActiveRecord::Schema.define(version: 20151120163830) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.integer  "resident_id"
    t.integer  "question_id"
    t.string   "text"
    t.integer  "apo_id"
    t.integer  "room_id"
    t.integer  "concept_id"
    t.integer  "attribute_id"
    t.integer  "synchronized"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "answers", ["apo_id"], name: "index_answers_on_apo_id", using: :btree
  add_index "answers", ["attribute_id"], name: "index_answers_on_attribute_id", using: :btree
  add_index "answers", ["concept_id"], name: "index_answers_on_concept_id", using: :btree
  add_index "answers", ["question_id"], name: "index_answers_on_question_id", using: :btree
  add_index "answers", ["resident_id"], name: "index_answers_on_resident_id", using: :btree
  add_index "answers", ["room_id"], name: "index_answers_on_room_id", using: :btree

  create_table "apos", force: :cascade do |t|
    t.string   "name"
    t.string   "text"
    t.string   "city"
    t.string   "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "attributes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "concepts", force: :cascade do |t|
    t.string   "name"
    t.integer  "order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "qualifiers", force: :cascade do |t|
    t.string   "text"
    t.integer  "begin"
    t.integer  "end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string   "text"
    t.integer  "type"
    t.integer  "order"
    t.integer  "scale_colors"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "residents", force: :cascade do |t|
    t.string   "apartment_number"
    t.string   "block"
    t.integer  "apo_id"
    t.string   "time_answer"
    t.integer  "synchronized"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "residents", ["apo_id"], name: "index_residents_on_apo_id", using: :btree

  create_table "rooms", force: :cascade do |t|
    t.string   "name"
    t.integer  "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "technicals", force: :cascade do |t|
    t.string   "name"
    t.integer  "respondent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
