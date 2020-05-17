# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_05_17_105354) do

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

  create_table "employees", force: :cascade do |t|
    t.bigint "organisation_id", null: false
    t.string "email"
    t.string "password_digest"
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.integer "seniority", default: 0, null: false, comment: "Number of months in the organisation"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_employees_on_email", unique: true
    t.index ["organisation_id"], name: "index_employees_on_organisation_id"
  end

  create_table "organisations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "perks", force: :cascade do |t|
    t.bigint "organisation_id", null: false
    t.string "name"
    t.integer "period", comment: "Period in months"
    t.integer "maximum_amount", comment: "Maximum amount in euros"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.jsonb "rules", default: [], null: false
    t.index ["name"], name: "index_perks_on_name", unique: true
    t.index ["organisation_id"], name: "index_perks_on_organisation_id"
  end

  create_table "reimbursement_requests", force: :cascade do |t|
    t.bigint "employee_id", null: false
    t.bigint "perk_id", null: false
    t.integer "amount"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["employee_id"], name: "index_reimbursement_requests_on_employee_id"
    t.index ["perk_id"], name: "index_reimbursement_requests_on_perk_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "employees", "organisations"
  add_foreign_key "perks", "organisations"
  add_foreign_key "reimbursement_requests", "employees"
  add_foreign_key "reimbursement_requests", "perks"
end
