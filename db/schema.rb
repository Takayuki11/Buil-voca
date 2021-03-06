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

ActiveRecord::Schema.define(version: 2020_10_13_113500) do

  create_table "favorites", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "word_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "word_id"], name: "index_favorites_on_user_id_and_word_id", unique: true
    t.index ["user_id"], name: "index_favorites_on_user_id"
    t.index ["word_id"], name: "index_favorites_on_word_id"
  end

  create_table "inquiries", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "relationships", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "follow_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["follow_id"], name: "index_relationships_on_follow_id"
    t.index ["user_id", "follow_id"], name: "index_relationships_on_user_id_and_follow_id", unique: true
    t.index ["user_id"], name: "index_relationships_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "eikenlevel"
    t.string "toeiclevel"
    t.string "goal"
    t.string "password_digest"
    t.boolean "teacher", default: false
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "words", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "content"
    t.string "meaning"
    t.string "example"
    t.boolean "eiken", default: false
    t.boolean "toeic", default: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "translation"
    t.index ["user_id"], name: "index_words_on_user_id"
  end

  add_foreign_key "favorites", "users"
  add_foreign_key "favorites", "words"
  add_foreign_key "relationships", "users"
  add_foreign_key "relationships", "users", column: "follow_id"
  add_foreign_key "words", "users"
end
