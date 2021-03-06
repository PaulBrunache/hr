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

ActiveRecord::Schema.define(version: 20160915054934) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "departments", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string   "first_name",             default: "", null: false
    t.string   "last_name",              default: "", null: false
    t.string   "employee_number",        default: "", null: false
    t.integer  "department_id"
    t.string   "phone_number"
    t.integer  "points",                 default: 0,  null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["department_id"], name: "index_employees_on_department_id", using: :btree
    t.index ["email"], name: "index_employees_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_employees_on_reset_password_token", unique: true, using: :btree
  end

  create_table "human_resources", force: :cascade do |t|
    t.string   "first_name",             default: "",                null: false
    t.string   "last_name",              default: "",                null: false
    t.string   "email",                  default: "",                null: false
    t.string   "role",                   default: "Human Resources", null: false
    t.string   "encrypted_password",     default: "",                null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,                 null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.index ["email"], name: "index_human_resources_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_human_resources_on_reset_password_token", unique: true, using: :btree
  end

  create_table "job_postings", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "referrals", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone_number"
    t.boolean  "pending",                 default: true
    t.boolean  "phone_eval",              default: false
    t.boolean  "unqualified",             default: false
    t.boolean  "hr_eval",                 default: false
    t.boolean  "no_position",             default: false
    t.boolean  "interview",               default: false
    t.boolean  "hired_hourly",            default: false
    t.boolean  "hired_salaried",          default: false
    t.boolean  "hired_hard_to_fill",      default: false
    t.boolean  "not_selected_eligible",   default: false
    t.boolean  "not_selected_ineligible", default: false
    t.text     "phone_screening",         default: "{\"contacted1\":false,\"contacted2\":false,\"contacted3\":false,\"unqualified\":false,\"sent_to_hr\":false}"
    t.text     "hr_screening",            default: "{\"no_position\":false,\"not_qualified\":false,\"move_to_interview\":false}"
    t.integer  "employee_id"
    t.integer  "job_posting_id"
    t.datetime "created_at",                                                                                                                                      null: false
    t.datetime "updated_at",                                                                                                                                      null: false
    t.index ["employee_id"], name: "index_referrals_on_employee_id", using: :btree
    t.index ["job_posting_id"], name: "index_referrals_on_job_posting_id", using: :btree
  end

  add_foreign_key "employees", "departments"
  add_foreign_key "referrals", "employees"
  add_foreign_key "referrals", "job_postings"
end
