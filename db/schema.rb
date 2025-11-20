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

ActiveRecord::Schema[8.0].define(version: 2025_11_20_152547) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "buildings", force: :cascade do |t|
    t.string "name"
    t.integer "location_id"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inventories", force: :cascade do |t|
    t.integer "size", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type"
  end

  create_table "item_types", primary_key: "name", id: :string, force: :cascade do |t|
  end

  create_table "items", force: :cascade do |t|
    t.string "name", null: false
    t.text "description", null: false
    t.integer "level", null: false
    t.integer "parent_inventory_id"
    t.integer "created_by_id", null: false
    t.string "type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "color", null: false
    t.integer "stack_amount", default: 1, null: false
    t.integer "child_inventory_id"
    t.boolean "is_private", default: false, null: false
    t.integer "boost", default: 0, null: false
  end

  create_table "levels", force: :cascade do |t|
    t.string "name", null: false
  end

  create_table "listings", force: :cascade do |t|
    t.integer "item_id"
    t.integer "created_by_id"
    t.integer "building_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "price", default: 1, null: false
    t.boolean "infinite", default: false, null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string "name", null: false
    t.integer "pos_x", null: false
    t.integer "pos_y", null: false
    t.text "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "bg_color", default: "#000", null: false
    t.string "highlight_color"
    t.integer "property_id"
    t.index ["name"], name: "index_locations_on_name", unique: true
    t.index ["pos_x", "pos_y"], name: "index_locations_on_pos_x_and_pos_y", unique: true
  end

  create_table "resource_types", primary_key: "name", id: :string, force: :cascade do |t|
  end

  create_table "resources", force: :cascade do |t|
    t.integer "location_id", null: false
    t.string "type", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "level", null: false
    t.string "color"
  end

  create_table "user_statuses", primary_key: "name", id: :string, force: :cascade do |t|
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "energy", null: false
    t.string "status", default: "Resting", null: false
    t.integer "location_id"
    t.integer "vehicle_id"
    t.integer "tool_id"
    t.integer "vitality", default: 100, null: false
    t.integer "age", default: 16, null: false
    t.integer "inventory_id"
    t.integer "credits", default: 0, null: false
    t.string "tool_type"
    t.string "vehicle_type"
    t.boolean "receives_emails", default: false, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "inventories", "item_types", column: "type", primary_key: "name"
  add_foreign_key "items", "item_types", column: "type", primary_key: "name"
  add_foreign_key "resources", "resource_types", column: "type", primary_key: "name"
  add_foreign_key "users", "user_statuses", column: "status", primary_key: "name"
end
