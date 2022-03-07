# frozen_string_literal: true

class CreatePlayer < ActiveRecord::Migration[7.0]
  def change
    create_table :players do |t|
      t.references :game, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.boolean :is_spy, null: false, default: false
      t.integer :score, null: false, default: 0
      t.integer :spy_id
      t.boolean :is_ready, null: false, default: false

      t.timestamps
    end
  end
end
