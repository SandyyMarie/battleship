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
    expect(game.computer.board).to be_an_instance_of(Board)
  end

  it 'initilizes comp and player board' do
    expect(game.computer.board.render(true)).to eq("  1 2 3 4\nA . . . .\nB . . . .\nC . . . .\nD . . . .\n")
    expect(game.player.board.render(true)).to eq("  1 2 3 4\nA . . . .\nB . . . .\nC . . . .\nD . . . .\n")

  end

  it 'can trigger the end game when two ships have been sunk' do
    game.player.increase_ship_sunk
    game.player.increase_ship_sunk
    expect(game.end_game).to eq(true)
    #outputs "Aww the Computer wins!"
  end


end