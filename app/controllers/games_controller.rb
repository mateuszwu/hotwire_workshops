# frozen_string_literal: true

class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
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

  private

  def game_params
    params.require(:game).permit(:title, :password)
  end
end
