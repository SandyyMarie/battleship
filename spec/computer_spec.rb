require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/computer'
require './lib/player'

describe Computer do

    it 'is initialized with a board, ships, and count of ships sunk' do
        computer = Computer.new
        expect(computer.board).to be_an_instance_of(Board)
        expect(computer.cruiser).to be_an_instance_of(Ship)
        expect(computer.submarine).to be_an_instance_of(Ship)
        expect(computer.ships).to eq([computer.cruiser, computer.submarine])
        expect(computer.ships_sunk).to eq(0)
    end

    it 'computer starting board places a ship and cruiser to start' do
        computer = Computer.new
        computer.starting_board(reveal = false)
        require 'pry'; binding.pry
        # expect(computer.board.cells.find_all {|cell| cell.ship == "Cruiser"}.count).to eq(3)
    end

    it 'computer can place a ship on random coordinates' do
        computer = Computer.new

        expect(computer.comp_place("Cruiser").count).to eq(3)
        expect(computer.comp_place("Submarine").count).to eq(2)

    end

    it 'can increase number of ships sunk' do
        computer = Computer.new
        computer.increase_ship_sunk
        computer.increase_ship_sunk

        expect(computer.ships_sunk).to eq(2)
    end

end

