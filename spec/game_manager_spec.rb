require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/computer'
require './lib/player'
require './game_manager'
require './turn.rb'

RSpec.describe GameManager do
    game = GameManager.new


    it 'exists' do
        expect(game).to be_an_instance_of(GameManager)
        expect(game.comp_board).to be_an_instance_of(Board)
    end

    xit 'initilizes comp and player board' do
      expect(comp_board.render(true)).to eq("  1 2 3 4\nA . . . .\nB . . . .\nC . . . .\nD . . . .\n")
      expect(player_board.render(true)).to eq("  1 2 3 4\nA . . . .\nB . . . .\nC . . . .\nD . . . .\n")

    end


    xit 'players can place' do
      player_board.place(play_cruiser,["A1", "B1", "C1"])
      player_board.place(play_submarine, ["D1", "D2"])
      expect(player_board.render(true)).to eq("  1 2 3 4\nA S . . .\nB S . . .\nC S . . .\nD S S . .\n")
    end

end