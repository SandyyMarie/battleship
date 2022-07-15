require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/computer'
require './lib/player'

RSpec.describe Turn do
    before :each do
        @comp_board = Board.new
        @player_board = Board.new
        @comp_cruiser = Ship.new("Cruiser", 3)
        @comp_submarine = Ship.new("Submarine", 2)
        @play_cruiser = Ship.new("Cruiser", 3)
        @play_submarine = Ship.new("Submarine", 2)
        @turn = Turn.new(@comp_board, @player_board)
    end

    it 'exists' do
        expect(@turn).to be_a(Turn)
    end

    it 'can render the comp_board' do
        expect(@turn.comp_board.render).to eq("  1 2 3 4\nA . . . .\nB . . . .\nC . . . .\nD . . . .\n")
    end

end

