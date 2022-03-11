# frozen_string_literal: true

class Game < ApplicationRecord
  belongs_to :user, foreign_key: :create_user_id
  has_many :players, dependent: :delete_all
  has_and_belongs_to_many :places, dependent: :delete_all
  belongs_to :current_place, class_name: 'Place', foreign_key: :current_place_id, optional: true

  validates :title, :password, :create_user_id, presence: true
  after_update_commit do |game|
    # broadcast_update_to :game_show, target: game, locals: { game: self, user: User.current, player: User.current.players.find_by(game_id: self.id) }
    # game.players.each do |player|
    #   broadcast_update_to game, target: "game_id_#{game.id}-player_id#{player.id}", locals: { game: self, user: User.current, player: User.current.players.find_by(game_id: self.id) }
    #   # game.broadcast_action(:update, locals: { user: player.user, player: player })
    # end
  end
end
