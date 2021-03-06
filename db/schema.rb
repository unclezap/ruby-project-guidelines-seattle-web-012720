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

ActiveRecord::Schema.define(version: 5) do

  create_table "cards", force: :cascade do |t|
    t.integer "color"
    t.integer "shape"
    t.integer "number"
    t.integer "shading"
  end

  create_table "games", force: :cascade do |t|
    t.integer "player_id"
    t.integer "tricks_taken"
    t.integer "tricks_lost"
    t.string "game_result"
    t.integer "difficulty"
    t.index ["player_id"], name: "index_games_on_player_id"
  end

  create_table "lists", force: :cascade do |t|
    t.string "rand_seed"
    t.integer "game_id"
    t.index ["game_id"], name: "index_lists_on_game_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.string "tagline"
  end

  create_table "shuffles", force: :cascade do |t|
    t.integer "game_id"
    t.integer "card_id"
    t.integer "list_id"
    t.boolean "on_board"
    t.boolean "in_deck"
    t.string "taken"
    t.index ["card_id"], name: "index_shuffles_on_card_id"
    t.index ["game_id"], name: "index_shuffles_on_game_id"
    t.index ["list_id"], name: "index_shuffles_on_list_id"
  end

end
