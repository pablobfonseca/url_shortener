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

ActiveRecord::Schema.define(version: 2022_12_22_130560) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "migrations", id: false, force: :cascade do |t|
    t.text "version", null: false
  end

  create_table "newsletter_subscribers", primary_key: "email", id: :text, force: :cascade do |t|
    t.text "token", null: false
    t.boolean "confirmed", default: false, null: false
    t.boolean "active", default: true, null: false
    t.datetime "created", default: -> { "now()" }, null: false
    t.datetime "updated", default: -> { "now()" }, null: false
  end

  create_table "tolk_locales", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["name"], name: "index_tolk_locales_on_name", unique: true
  end

  create_table "tolk_phrases", id: :serial, force: :cascade do |t|
    t.text "key"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tolk_translations", id: :serial, force: :cascade do |t|
    t.integer "phrase_id"
    t.integer "locale_id"
    t.text "text"
    t.text "previous_text"
    t.boolean "primary_updated", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["phrase_id", "locale_id"], name: "index_tolk_translations_on_phrase_id_and_locale_id", unique: true
  end

  create_table "urls", force: :cascade do |t|
    t.string "title"
    t.string "original_url"
    t.string "shortened_url"
    t.integer "accesses", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["accesses"], name: "index_urls_on_accesses"
    t.index ["shortened_url"], name: "index_urls_on_shortened_url"
  end

end
