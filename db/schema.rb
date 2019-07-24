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

ActiveRecord::Schema.define(version: 2019_07_24_023907) do

  create_table "client_plans", force: :cascade do |t|
    t.integer "client_id", null: false
    t.integer "plan_id", null: false
    t.decimal "discounts"
    t.decimal "surcharges"
    t.datetime "started_at"
    t.datetime "ended_at"
    t.decimal "base_price"
    t.decimal "total"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_client_plans_on_client_id"
    t.index ["plan_id"], name: "index_client_plans_on_plan_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "plans", force: :cascade do |t|
    t.string "name"
    t.string "periodicity"
    t.decimal "base_value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "client_plans", "clients"
  add_foreign_key "client_plans", "plans"
end
