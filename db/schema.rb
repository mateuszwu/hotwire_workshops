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

ActiveRecord::Schema[7.0].define(version: 20_220_307_200_638) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'games', force: :cascade do |t|
    t.string 'title'
    t.string 'password'
    t.bigint 'create_user_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.boolean 'is_started', default: false, null: false
    t.bigint 'current_place_id'
    t.index ['create_user_id'], name: 'index_games_on_create_user_id'
    t.index ['current_place_id'], name: 'index_games_on_current_place_id'
  end

  create_table 'games_places', force: :cascade do |t|
    t.bigint 'game_id', null: false
    t.bigint 'place_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['game_id'], name: 'index_games_places_on_game_id'
    t.index ['place_id'], name: 'index_games_places_on_place_id'
  end

  create_table 'places', force: :cascade do |t|
    t.string 'name', default: '', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'players', force: :cascade do |t|
    t.bigint 'game_id', null: false
    t.bigint 'user_id', null: false
    t.boolean 'is_spy', default: false, null: false
    t.integer 'score', default: 0, null: false
    t.integer 'spy_id'
    t.boolean 'is_ready', default: false, null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['game_id'], name: 'index_players_on_game_id'
    t.index ['user_id'], name: 'index_players_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'games', 'places', column: 'current_place_id'
  add_foreign_key 'games', 'users', column: 'create_user_id'
  add_foreign_key 'games_places', 'games'
  add_foreign_key 'games_places', 'places'
  add_foreign_key 'players', 'games'
  add_foreign_key 'players', 'users'
end
