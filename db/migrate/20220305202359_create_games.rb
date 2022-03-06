# frozen_string_literal: true

class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.string :title
      t.string :password
      t.references :create_user, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
