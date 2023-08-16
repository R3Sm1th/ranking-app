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

ActiveRecord::Schema[7.0].define(version: 2023_08_16_103332) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "round_id", null: false
    t.string "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["round_id"], name: "index_comments_on_round_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "leagues", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "no_players"
    t.integer "max_players"
    t.integer "no_rounds"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rounds", force: :cascade do |t|
    t.string "theme"
    t.string "description"
    t.bigint "league_id", null: false
    t.string "current"
    t.integer "round"
    t.datetime "submission_deadline"
    t.datetime "voting_deadline"
    t.boolean "completed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["league_id"], name: "index_rounds_on_league_id"
  end

  create_table "submissions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "round_id", null: false
    t.string "moviename"
    t.string "movieid"
    t.string "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["round_id"], name: "index_submissions_on_round_id"
    t.index ["user_id"], name: "index_submissions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_leagues", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "league_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["league_id"], name: "index_users_leagues_on_league_id"
    t.index ["user_id"], name: "index_users_leagues_on_user_id"
  end

  add_foreign_key "comments", "rounds"
  add_foreign_key "comments", "users"
  add_foreign_key "rounds", "leagues"
  add_foreign_key "submissions", "rounds"
  add_foreign_key "submissions", "users"
  add_foreign_key "users_leagues", "leagues"
  add_foreign_key "users_leagues", "users"
end
