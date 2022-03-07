class ResetRound
  def initialize(game)
    @game = game
  end

  def call
    game.players.update_all(is_spy: false)
    place = Place.where.not(id: game.places).order(Arel.sql('RANDOM()')).first
    game.places << place
    game.update(current_place: place, is_started: true)
    game.players.order(Arel.sql('RANDOM()')).first.update(is_spy: true)
  end

  def self.call(game)
    new(game).call
  end

  private

  attr_reader :game
end
