# frozen_string_literal: true

class Game < ApplicationRecord
  belongs_to :user, foreign_key: :create_user_id
  has_many :players, dependent: :delete_all
  has_and_belongs_to_many :places, dependent: :delete_all
  belongs_to :current_place, class_name: 'Place', foreign_key: :current_place_id, optional: true

  validates :title, :password, :create_user_id, presence: true
end
