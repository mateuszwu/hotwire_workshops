# frozen_string_literal: true

class CreateGamesPlaces < ActiveRecord::Migration[7.0]
  def change
    create_table :games_places do |t|
      t.references :game, null: false, foreign_key: true
      t.references :place, null: false, foreign_key: true

      t.timestamps
    end
  end
end
