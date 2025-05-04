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

ActiveRecord::Schema[7.1].define(version: 2025_04_23_151830) do
  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "full_name", null: false
    t.string "uid", null: false
    t.integer "role", default: 1, null: false
    t.integer "status", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email"
  end

  create_table "application_settings", force: :cascade do |t|
    t.string "key", null: false
    t.string "value", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["key"], name: "index_application_settings_on_key"
  end

  create_table "fitness_plans", force: :cascade do |t|
    t.integer "category", null: false
    t.string "title", null: false
    t.boolean "with_diet", default: false
    t.string "content_video_link"
    t.string "details"
    t.boolean "personal_training", default: false
    t.integer "monthly", null: false
    t.integer "quarterly", null: false
    t.integer "half_yearly", null: false
    t.integer "yearly", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category"], name: "index_fitness_plans_on_category"
    t.index ["title"], name: "index_fitness_plans_on_title"
  end

  create_table "get_in_touches", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.text "message", null: false
    t.string "phone_number", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_fitness_plans", force: :cascade do |t|
    t.integer "user_id"
    t.integer "fitness_plan_id"
    t.integer "status"
    t.date "start_date"
    t.date "end_date"
    t.integer "category"
    t.integer "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fitness_plan_id"], name: "index_user_fitness_plans_on_fitness_plan_id"
    t.index ["user_id"], name: "index_user_fitness_plans_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "phone_number", null: false
    t.string "address", null: false
    t.string "guardian_name", null: false
    t.string "guardian_phone_number", null: false
    t.integer "blood_group", null: false
    t.text "medical_history"
    t.string "aadhaar_number", null: false
    t.date "joining_date", null: false
    t.string "status", null: false
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["aadhaar_number"], name: "index_users_on_aadhaar_number", unique: true
    t.index ["blood_group"], name: "index_users_on_blood_group"
    t.index ["first_name"], name: "index_users_on_first_name"
    t.index ["last_name"], name: "index_users_on_last_name"
    t.index ["phone_number"], name: "index_users_on_phone_number", unique: true
  end

end
