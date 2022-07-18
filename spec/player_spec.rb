require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/computer'
require './lib/player'

describe Player do
    it 'is initialized with a board, ships, and count of ships sunk' do
        player = Player.new
        expect(player.board).to be_an_instance_of(Board)
        expect(player.cruiser).to be_an_instance_of(Ship)
        expect(player.submarine).to be_an_instance_of(Ship)
        expect(player.ships).to eq([player.cruiser, player.submarine])
        expect(player.ships_sunk).to eq(0)
    end

    it 'can increase number of ships sunk' do
        player = Player.new
        player.increase_ship_sunk
        player.increase_ship_sunk

        expect(player.ships_sunk).to eq(2)
    end
end

#Stephen - initialize test and increase ship sunk test∑