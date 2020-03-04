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

ActiveRecord::Schema.define(version: 2020_03_04_130638) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "bills", force: :cascade do |t|
    t.string "num_bill"
    t.float "total"
    t.date "issue_date"
    t.boolean "status"
    t.string "bill_doc"
    t.string "paid_doc"
    t.bigint "department_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_bills_on_department_id"
  end

  create_table "buildings", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "building_img"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "communications", force: :cascade do |t|
    t.string "num_release"
    t.string "title"
    t.string "content"
    t.boolean "status"
    t.string "document"
    t.bigint "building_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["building_id"], name: "index_communications_on_building_id"
  end

  create_table "concepts", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "departments", force: :cascade do |t|
    t.string "num_dep"
    t.string "floor"
    t.boolean "defaulting"
    t.boolean "habitability"
    t.float "collection"
    t.bigint "building_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["building_id"], name: "index_departments_on_building_id"
  end

  create_table "expenses_details", force: :cascade do |t|
    t.float "amount"
    t.bigint "bill_id"
    t.bigint "concept_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "expenses_type"
    t.index ["bill_id"], name: "index_expenses_details_on_bill_id"
    t.index ["concept_id"], name: "index_expenses_details_on_concept_id"
  end

  create_table "user_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.string "phone"
    t.bigint "department_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_type_id"
    t.index ["department_id"], name: "index_users_on_department_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["user_type_id"], name: "index_users_on_user_type_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "bills", "departments"
  add_foreign_key "communications", "buildings"
  add_foreign_key "departments", "buildings"
  add_foreign_key "expenses_details", "bills"
  add_foreign_key "expenses_details", "concepts"
  add_foreign_key "users", "user_types"
end
