require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/computer'
require './lib/player'
require './lib/game_manager'
require './lib/turn'

def start
  game = GameManager.new
  if game.welcome_message == "p"

    game.setup

    game_over = game.turn

    while !game_over
      game_over = game.turn
    end
  else
    game.welcome_message
  end

end

start
