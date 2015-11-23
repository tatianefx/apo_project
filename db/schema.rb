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

ActiveRecord::Schema.define(version: 20151122215330) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.integer "resident_id"
    t.integer "question_id"
    t.string  "text_"
    t.integer "apo_id"
    t.integer "room_id"
    t.integer "concept_id"
    t.integer "attribute_id"
    t.integer "synchronized"
  end

  add_index "answers", ["apo_id"], name: "index_answers_on_apo_id", using: :btree
  add_index "answers", ["attribute_id"], name: "index_answers_on_attribute_id", using: :btree
  add_index "answers", ["concept_id"], name: "index_answers_on_concept_id", using: :btree
  add_index "answers", ["question_id"], name: "index_answers_on_question_id", using: :btree
  add_index "answers", ["resident_id"], name: "index_answers_on_resident_id", using: :btree
  add_index "answers", ["room_id"], name: "index_answers_on_room_id", using: :btree

  create_table "apos", force: :cascade do |t|
    t.string "name"
    t.string "text"
    t.string "city"
    t.string "state"
  end

  create_table "apos_technicals", id: false, force: :cascade do |t|
    t.integer "apo_id"
    t.integer "technical_id"
  end

  add_index "apos_technicals", ["apo_id"], name: "index_apos_technicals_on_apo_id", using: :btree
  add_index "apos_technicals", ["technical_id"], name: "index_apos_technicals_on_technical_id", using: :btree

  create_table "attributes", force: :cascade do |t|
    t.string "name"
  end

  create_table "attributes_questions", id: false, force: :cascade do |t|
    t.integer "attribute_id"
    t.integer "question_id"
  end

  add_index "attributes_questions", ["attribute_id"], name: "index_attributes_questions_on_attribute_id", using: :btree
  add_index "attributes_questions", ["question_id"], name: "index_attributes_questions_on_question_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string "name"
  end

  create_table "categories_questions", id: false, force: :cascade do |t|
    t.integer "category_id"
    t.integer "question_id"
  end

  add_index "categories_questions", ["category_id"], name: "index_categories_questions_on_category_id", using: :btree
  add_index "categories_questions", ["question_id"], name: "index_categories_questions_on_question_id", using: :btree

  create_table "categories_technicals", id: false, force: :cascade do |t|
    t.integer "category_id"
    t.integer "technical_id"
  end

  add_index "categories_technicals", ["category_id"], name: "index_categories_technicals_on_category_id", using: :btree
  add_index "categories_technicals", ["technical_id"], name: "index_categories_technicals_on_technical_id", using: :btree

  create_table "concepts", force: :cascade do |t|
    t.string  "name"
    t.integer "order"
  end

  create_table "concepts_qualifiers_questions", id: false, force: :cascade do |t|
    t.integer "concept_id"
    t.integer "qualifier_id"
    t.integer "question_id"
  end

  add_index "concepts_qualifiers_questions", ["concept_id"], name: "index_concepts_qualifiers_questions_on_concept_id", using: :btree
  add_index "concepts_qualifiers_questions", ["qualifier_id"], name: "index_concepts_qualifiers_questions_on_qualifier_id", using: :btree
  add_index "concepts_qualifiers_questions", ["question_id"], name: "index_concepts_qualifiers_questions_on_question_id", using: :btree

  create_table "concepts_questions", id: false, force: :cascade do |t|
    t.integer "concept_id"
    t.integer "question_id"
  end

  add_index "concepts_questions", ["concept_id"], name: "index_concepts_questions_on_concept_id", using: :btree
  add_index "concepts_questions", ["question_id"], name: "index_concepts_questions_on_question_id", using: :btree

  create_table "qualifiers", force: :cascade do |t|
    t.string  "text"
    t.integer "begin_"
    t.integer "end_"
  end

  create_table "qualifiers_questions", id: false, force: :cascade do |t|
    t.integer "qualifier_id"
    t.integer "question_id"
  end

  add_index "qualifiers_questions", ["qualifier_id"], name: "index_qualifiers_questions_on_qualifier_id", using: :btree
  add_index "qualifiers_questions", ["question_id"], name: "index_qualifiers_questions_on_question_id", using: :btree

  create_table "questions", force: :cascade do |t|
    t.string  "text"
    t.integer "type_question"
    t.integer "order"
    t.integer "scale_colors"
  end

  create_table "questions_rooms", id: false, force: :cascade do |t|
    t.integer "question_id"
    t.integer "room_id"
  end

  add_index "questions_rooms", ["question_id"], name: "index_questions_rooms_on_question_id", using: :btree
  add_index "questions_rooms", ["room_id"], name: "index_questions_rooms_on_room_id", using: :btree

  create_table "residents", force: :cascade do |t|
    t.string  "apartment_number"
    t.string  "block"
    t.integer "apo_id"
    t.string  "time_answer"
    t.integer "synchronized"
  end

  add_index "residents", ["apo_id"], name: "index_residents_on_apo_id", using: :btree

  create_table "rooms", force: :cascade do |t|
    t.string  "name"
    t.integer "type_room"
  end

  create_table "technicals", force: :cascade do |t|
    t.string  "name"
    t.integer "respondent"
  end

  create_table "uploads", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
