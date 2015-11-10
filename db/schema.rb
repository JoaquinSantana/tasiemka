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

ActiveRecord::Schema.define(version: 20151110112203) do

  create_table "articles", force: :cascade do |t|
    t.text     "title"
    t.integer  "site_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.text     "article_url"
    t.datetime "dodano"
    t.integer  "visits_count",  default: 0
    t.text     "image"
    t.string   "kolekcja"
    t.string   "lajk"
    t.boolean  "have_image"
    t.integer  "category_id"
    t.string   "ytid"
    t.text     "thumbnail_url"
    t.text     "description"
  end

  add_index "articles", ["article_url"], name: "index_articles_on_article_url"
  add_index "articles", ["site_id"], name: "index_articles_on_site_id"
  add_index "articles", ["title"], name: "index_articles_on_title"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.integer  "site_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "color"
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "email"
    t.boolean  "subscribe"
    t.string   "topic"
    t.text     "wiadomosc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sites", force: :cascade do |t|
    t.text     "name"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.text     "favurl"
    t.string   "site_color"
    t.integer  "visits_count", default: 0
    t.boolean  "have_image"
    t.boolean  "only_image",   default: false
    t.string   "ytid"
    t.text     "description"
    t.boolean  "ytchannel",    default: false
  end

  add_index "sites", ["name"], name: "index_sites_on_name"

end
