# frozen_string_literal: true

class PlayersController < ApplicationController
  def create
    Player.create(
      game_id: params[:game_id],
      user_id: current_user.id
    )

    redirect_to game_path(params[:game_id])
  end

  def destroy
    Player.find_by(user_id: current_user.id, game_id: params[:game_id]).destroy

    redirect_to games_path, status: :see_other
  end

  def get_ready
    Player.find_by(user_id: current_user.id, game_id: params[:game_id]).update(is_ready: true)
    game = Game.find(params[:game_id])

    ResetRound.call(game) if game.players.all?(&:is_ready?)

    redirect_to game_path(params[:game_id])
  end
end
