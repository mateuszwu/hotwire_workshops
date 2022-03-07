# frozen_string_literal: true

class AddCurrentPlaceToGames < ActiveRecord::Migration[7.0]
  def change
    add_reference :games, :current_place, foreign_key: { to_table: :places }
  end
end
