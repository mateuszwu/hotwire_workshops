# frozen_string_literal: true

class Player < ApplicationRecord
  belongs_to :user
  belongs_to :game

  validates :game_id, :user_id, presence: true

  def full_name
    user.email
  end
end
