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

ActiveRecord::Schema[7.0].define(version: 2023_04_20_095815) do
  create_table "activities", force: :cascade do |t|
    t.integer "category_id", null: false
    t.string "activity_name"
    t.text "description"
    t.string "activity_image"
    t.integer "reward"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_activities_on_category_id"
  end

  create_table "activity_steps", force: :cascade do |t|
    t.integer "activity_id", null: false
    t.string "step_name"
    t.string "step_description"
    t.integer "step_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "step_image"
    t.index ["activity_id"], name: "index_activity_steps_on_activity_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "category_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "learning_progresses", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "activity_id", null: false
    t.integer "current_step"
    t.boolean "is_completed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["activity_id"], name: "index_learning_progresses_on_activity_id"
    t.index ["user_id"], name: "index_learning_progresses_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.text "bio"
    t.integer "stars"
    t.integer "user_level"
    t.datetime "last_failed_login"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "activities", "categories"
  add_foreign_key "activity_steps", "activities"
  add_foreign_key "learning_progresses", "activities"
  add_foreign_key "learning_progresses", "users"
end
