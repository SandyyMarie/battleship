require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/computer'
require './lib/player'

describe GameManager do

comp_board = Board.new
player_board = Board.new
comp_cruiser = Ship.new("Cruiser", 3)
comp_submarine = Ship.new("Submarine", 2)
play_cruiser = Ship.new("Cruiser", 3)
play_submarine = Ship.new("Submarine", 2)
comp_ships = [@comp_cruiser, @comp_submarine]
play_ships = [@comp_cruiser, @comp_submarine]
turn = Turn.new(@comp_board, @player_board)

    it 'test that welcome method works' do


end
