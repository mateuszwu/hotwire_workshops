# frozen_string_literal: true

class Game < ApplicationRecord
  belongs_to :user, foreign_key: :create_user_id

  validates :title, :password, :create_user_id, presence: true
end
