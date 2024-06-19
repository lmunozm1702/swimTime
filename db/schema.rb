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

ActiveRecord::Schema[7.0].define(version: 2024_06_19_225244) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "proofs", force: :cascade do |t|
    t.integer "style"
    t.integer "distance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "races", force: :cascade do |t|
    t.time "start"
    t.time "end"
    t.integer "pool_type"
    t.bigint "proofs_id", null: false
    t.integer "genre"
    t.integer "proof_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "style"
    t.integer "distance"
    t.index ["proofs_id"], name: "index_races_on_proofs_id"
  end

  add_foreign_key "races", "proofs", column: "proofs_id"
end
