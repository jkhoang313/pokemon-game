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

ActiveRecord::Schema.define(version: 20161227184459) do

  create_table "pokedexes", force: :cascade do |t|
    t.string   "name"
    t.integer  "level",           default: 1
    t.string   "hp"
    t.string   "attack"
    t.string   "defense"
    t.string   "special_attack"
    t.string   "special_defense"
    t.string   "speed"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "pokemons", force: :cascade do |t|
    t.integer  "trainer_id"
    t.integer  "pokedex_id"
    t.string   "name"
    t.integer  "level",           default: 1
    t.string   "hp"
    t.string   "attack"
    t.string   "defense"
    t.string   "special_attack"
    t.string   "special_defense"
    t.string   "speed"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "trainers", force: :cascade do |t|
    t.string   "name"
    t.string   "password_digest"
    t.string   "age"
    t.string   "gender"
    t.string   "starter_pokemon"
    t.integer  "poke_tokens",     default: 5
    t.integer  "last_token"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

end
