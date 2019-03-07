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

ActiveRecord::Schema.define(version: 2019_02_27_180728) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.integer "number"
    t.string "voie_type"
    t.string "street"
    t.string "postal_code"
    t.string "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "start"
    t.datetime "end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "address_id"
    t.bigint "user_id"
    t.index ["address_id"], name: "index_events_on_address_id"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "formations", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "link"
    t.string "position"
    t.integer "position_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "formations_positions", id: false, force: :cascade do |t|
    t.bigint "position_id", null: false
    t.bigint "formation_id", null: false
    t.index ["formation_id", "position_id"], name: "index_formations_positions_on_formation_id_and_position_id"
    t.index ["position_id", "formation_id"], name: "index_formations_positions_on_position_id_and_formation_id"
  end

  create_table "identification_numbers", force: :cascade do |t|
    t.integer "id_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "position_validations", force: :cascade do |t|
    t.boolean "approved", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "position_id"
    t.index ["position_id"], name: "index_position_validations_on_position_id"
    t.index ["user_id"], name: "index_position_validations_on_user_id"
  end

  create_table "positions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "surname", default: "", null: false
    t.string "lastname", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.integer "id_number"
    t.bigint "position_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["position_id"], name: "index_users_on_position_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "events", "addresses"
  add_foreign_key "events", "users"
  add_foreign_key "position_validations", "positions"
  add_foreign_key "position_validations", "users"
  add_foreign_key "users", "positions"
end
