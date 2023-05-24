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

ActiveRecord::Schema[7.0].define(version: 2023_05_24_045958) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "configs", force: :cascade do |t|
    t.string "name"
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "names", force: :cascade do |t|
    t.string "nameable_type", null: false
    t.bigint "nameable_id", null: false
    t.bigint "theme_id", null: false
    t.text "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["nameable_type", "nameable_id"], name: "index_names_on_nameable"
    t.index ["theme_id"], name: "index_names_on_theme_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.bigint "zone_id", null: false
    t.integer "inspection_period"
    t.datetime "inspected_on"
    t.integer "snooze_duration"
    t.datetime "snoozed_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name_basic"
    t.string "name_fantasy"
    t.string "name_scifi"
    t.index ["zone_id"], name: "index_tasks_on_zone_id"
  end

  create_table "themes", force: :cascade do |t|
    t.text "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "zones", force: :cascade do |t|
    t.bigint "zone_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name_basic"
    t.string "name_fantasy"
    t.string "name_scifi"
    t.index ["zone_id"], name: "index_zones_on_zone_id"
  end

  add_foreign_key "names", "themes"
  add_foreign_key "tasks", "zones"
  add_foreign_key "zones", "zones"
end
