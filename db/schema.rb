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

ActiveRecord::Schema.define(version: 20160715215337) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "documents", force: :cascade do |t|
    t.string   "type"
    t.date     "emission_date"
    t.integer  "user_id"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "value",                          default: 0
    t.date     "caducity"
    t.integer  "status",                         default: 0
    t.integer  "description"
    t.text     "comentary"
    t.date     "from"
    t.date     "to"
  end

  add_index "documents", ["user_id"], name: "index_documents_on_user_id", using: :btree

  create_table "documents_issuers", force: :cascade do |t|
    t.integer "document_id"
    t.integer "issuer_id"
  end

  add_index "documents_issuers", ["document_id"], name: "index_documents_issuers_on_document_id", using: :btree
  add_index "documents_issuers", ["issuer_id"], name: "index_documents_issuers_on_issuer_id", using: :btree

  create_table "issuers", force: :cascade do |t|
    t.string   "name"
    t.string   "name_short"
    t.boolean  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "titles", force: :cascade do |t|
    t.integer "user_id"
    t.integer "university_id"
    t.integer "level"
  end

  add_index "titles", ["university_id"], name: "index_titles_on_university_id", using: :btree
  add_index "titles", ["user_id"], name: "index_titles_on_user_id", using: :btree

  create_table "universities", force: :cascade do |t|
    t.string   "name",              limit: 255
    t.string   "name_short",        limit: 255
    t.string   "level",             limit: 255
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "name",                   limit: 255
    t.string   "last_name",              limit: 255
    t.integer  "role",                               default: 3
    t.string   "avatar_file_name",       limit: 255
    t.string   "avatar_content_type",    limit: 255
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["last_name"], name: "index_users_on_last_name", using: :btree
  add_index "users", ["name"], name: "index_users_on_name", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
