require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/computer'
require './lib/player'

RSpec.describe Computer do
    computer = Computer.new

    it 'exists' do
        expect(computer).to be_a(Computer)
    end
end

