require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/computer'
require './lib/player'

RSpec.describe Player do
    player = Player.new

    it 'exists' do
        expect(player).to be_a(Player)
    end
end

