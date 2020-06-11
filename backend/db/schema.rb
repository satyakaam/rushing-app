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

ActiveRecord::Schema.define(version: 2020_06_05_023430) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_trgm"
  enable_extension "plpgsql"

  create_table "players", force: :cascade do |t|
    t.bigint "team_id"
    t.string "name"
    t.string "postion"
    t.decimal "attempts_per_game_average", precision: 10, scale: 2
    t.integer "attempts"
    t.decimal "total_yards", precision: 10, scale: 2
    t.decimal "average_yards_per_attempt", precision: 10, scale: 2
    t.string "yards_per_game"
    t.integer "total_touchdowns"
    t.decimal "longest_rush", precision: 10, scale: 2
    t.boolean "longest_rush_touchdown_occurred", default: false
    t.decimal "first_down", precision: 10, scale: 2
    t.decimal "first_down_pct", precision: 10, scale: 2
    t.decimal "twenty_yards_each", precision: 10, scale: 2
    t.decimal "fourty_yards_each", precision: 10, scale: 2
    t.decimal "fumbles", precision: 10, scale: 2
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_players_on_name", opclass: :gin_trgm_ops, using: :gin
    t.index ["team_id"], name: "index_players_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.string "abbreviation"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
