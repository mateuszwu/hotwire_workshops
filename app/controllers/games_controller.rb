# frozen_string_literal: true

class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
    @player = current_user.players.find_by(game_id: @game.id)

    redirect_to games_path unless @game.create_user_id == current_user.id || @player
  end

  def new
    @game = Game.new
  end

  def create
    Game.create(game_params.merge(create_user_id: current_user.id))

    redirect_to games_path
  end

  def update
    game = Game.find(params[:id])
    game.update(game_params)

    redirect_to games_path
  end

  def edit
    @game = Game.find(params[:id])
  end

  def destroy
    Game.find(params[:id]).destroy

    redirect_to games_path, status: :see_other
  end

  def guess_place
    @game = Game.find(params[:id])
    @player = Player.find_by(user_id: current_user.id, game_id: @game.id)
    if params[:place_id].to_i == @game.current_place.id
      @player.update(score: @player.score + 3)
    else
      @game.players.where.not(id: @player.id).each { |player| player.update(score: player.score + 1) }
    end
    ResetRound.call(@game)

    redirect_to game_path(@game.id)
  end

  def vote_for_spy
    @game = Game.find(params[:id])
    @player = Player.find(params[:spy_id])
    if @player.is_spy?
      @game.players.where.not(id: @player.id).each { |player| player.update(score: player.score + 2) }
    else
      @player.update(score: @player.score + 3)
    end
    ResetRound.call(@game)

    redirect_to game_path(@game.id)
  end

  private

  def game_params
    params.require(:game).permit(:title, :password)
  end
end
