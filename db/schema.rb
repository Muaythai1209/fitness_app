# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2025_04_11_171158) do
  create_table "users", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "phone_number", null: false
    t.string "address", null: false
    t.string "guardian_name", null: false
    t.string "guardian_phone_number", null: false
    t.string "blood_group", null: false
    t.text "medical_history", null: false
    t.string "aadhaar_number", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["aadhaar_number"], name: "index_users_on_aadhaar_number", unique: true
    t.index ["blood_group"], name: "index_users_on_blood_group", unique: true
    t.index ["first_name"], name: "index_users_on_first_name", unique: true
    t.index ["last_name"], name: "index_users_on_last_name", unique: true
    t.index ["phone_number"], name: "index_users_on_phone_number", unique: true
  end

end
