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

ActiveRecord::Schema.define(version: 20160217122249) do

  create_table "articles", force: :cascade do |t|
    t.text     "title"
    t.integer  "site_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.text     "article_url"
    t.datetime "dodano"
    t.integer  "visits_count",   default: 0
    t.text     "image"
    t.string   "kolekcja"
    t.string   "lajk"
    t.boolean  "have_image"
    t.integer  "category_id"
    t.string   "ytid"
    t.text     "thumbnail_url"
    t.text     "description"
    t.integer  "view"
    t.integer  "like"
    t.string   "category_title"
    t.integer  "vote_up",        default: 0
    t.integer  "vote_down",      default: 0
    t.integer  "votesum",        default: 0
  end

  add_index "articles", ["article_url"], name: "index_articles_on_article_url"
  add_index "articles", ["site_id"], name: "index_articles_on_site_id"
  add_index "articles", ["title"], name: "index_articles_on_title"
  add_index "articles", ["votesum"], name: "index_articles_on_votesum"

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

  create_table "votes", force: :cascade do |t|
    t.integer  "votable_id"
    t.string   "votable_type"
    t.integer  "voter_id"
    t.string   "voter_type"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope"
  add_index "votes", ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope"

end
