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

ActiveRecord::Schema.define(version: 2020_01_27_192149) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assessments", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "patient_id"
    t.boolean "symptomatic"
    t.string "temperature"
    t.boolean "felt_feverish"
    t.boolean "cough"
    t.boolean "sore_throat"
    t.boolean "difficulty_breathing"
    t.boolean "muscle_aches"
    t.boolean "headache"
    t.boolean "abdominal_discomfort"
    t.boolean "vomiting"
    t.boolean "diarrhea"
    t.index ["patient_id"], name: "index_assessments_on_patient_id"
  end

  create_table "patients", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.string "suffix"
    t.integer "dob_day"
    t.integer "dob_month"
    t.integer "dob_year"
    t.integer "age"
    t.string "sex"
    t.boolean "white"
    t.boolean "black_or_african_american"
    t.boolean "american_indian_or_alaska_native"
    t.boolean "asian"
    t.boolean "native_hawaiian_or_other_pacific_islander"
    t.boolean "ethnicity"
    t.string "primary_language"
    t.string "secondary_language"
    t.boolean "interpretation_required"
    t.string "residence_line_1"
    t.string "residence_line_2"
    t.string "residence_city"
    t.string "residence_county"
    t.string "residence_state"
    t.string "residence_country"
    t.string "email"
    t.string "phone"
    t.string "primary_phone"
    t.string "secondary_phone"
    t.integer "responder_id"
    t.integer "creator_id"
    t.string "submission_token"
    t.index ["creator_id"], name: "index_patients_on_creator_id"
    t.index ["responder_id"], name: "index_patients_on_responder_id"
    t.index ["submission_token"], name: "index_patients_on_submission_token"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

end
