# frozen_string_literal: true

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

ActiveRecord::Schema[7.0].define(version: 2024_06_22_230930) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "checkpoints", force: :cascade do |t|
    t.bigint "race_id", null: false
    t.datetime "start"
    t.datetime "end"
    t.datetime "arm_start"
    t.datetime "arm_end"
    t.float "arm_frequency"
    t.float "arm_distance"
    t.float "arm_speed"
    t.float "elapsed_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["race_id"], name: "index_checkpoints_on_race_id"
  end

  create_table "races", force: :cascade do |t|
    t.integer "pool_type"
    t.integer "proof_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "style"
    t.integer "distance"
    t.datetime "start_datetime"
    t.datetime "end_datetime"
  end

  add_foreign_key "checkpoints", "races"
end
