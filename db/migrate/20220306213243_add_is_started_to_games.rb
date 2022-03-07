# frozen_string_literal: true

class AddIsStartedToGames < ActiveRecord::Migration[7.0]
  def change
    add_column :games, :is_started, :boolean, null: false, default: false
  end
end
