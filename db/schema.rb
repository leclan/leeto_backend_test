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

ActiveRecord::Schema.define(version: 2020_08_19_132900) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "employees", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.bigint "organisation_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.date "hire_date"
    t.index ["email"], name: "index_employees_on_email", unique: true
    t.index ["organisation_id"], name: "index_employees_on_organisation_id"
    t.index ["reset_password_token"], name: "index_employees_on_reset_password_token", unique: true
  end

  create_table "organisations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "perks", force: :cascade do |t|
    t.string "name"
    t.decimal "maximum_amount", precision: 8, scale: 2
    t.datetime "start_date"
    t.datetime "end_date"
    t.bigint "organisation_id", null: false
    t.integer "seniority"
    t.index ["organisation_id"], name: "index_perks_on_organisation_id"
  end

  create_table "reimbursement_requests", force: :cascade do |t|
    t.bigint "perk_id", null: false
    t.bigint "employee_id", null: false
    t.decimal "amount", precision: 8, scale: 2
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["employee_id"], name: "index_reimbursement_requests_on_employee_id"
    t.index ["perk_id"], name: "index_reimbursement_requests_on_perk_id"
  end

  add_foreign_key "employees", "organisations"
  add_foreign_key "perks", "organisations"
  add_foreign_key "reimbursement_requests", "employees"
  add_foreign_key "reimbursement_requests", "perks"
end
