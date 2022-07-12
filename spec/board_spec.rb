require './lib/ship'
require './lib/cell'
require './lib/board'

RSpec.describe Board do
    board = Board.new

    it 'exists' do
        expect(board).to be_a(Board)
        expect(board.cells).to be_a(Hash)
        expect(board.cells.size).to eq(16)
    end

    it 'has valid coordinates' do
        expect(board.valid_coordinate?("A1")).to eq(true)
        expect(board.valid_coordinate?("D4")).to eq(true)
        expect(board.valid_coordinate?("A5")).to eq(false)
        expect(board.valid_coordinate?("E1")).to eq(false)
        expect(board.valid_coordinate?("A22")).to eq(false)
    end

    it 'checks if valid placement' do 
        cruiser = Ship.new("Cruiser", 3)
        submarine = Ship.new("Submarine", 2)

        #checks for same length
        expect(board.valid_placement?(cruiser, ["A1", "A2"])).to eq(false)
        expect(board.valid_placement?(submarine, ["A2", "A3", "A4"])).to eq(false)

        #checks if coordinates are consecutive
        expect(board.valid_placement?(cruiser, ["A1", "A2", "A4"])).to eq(false)
        expect(board.valid_placement?(submarine, ["A1", "C1"])).to eq(false)
        expect(board.valid_placement?(cruiser, ["A3", "A2", "A1"])).to eq(false)
        expect(board.valid_placement?(submarine, ["C1", "B1"])).to eq(false)

        #checks that its not diagonal
        expect(board.valid_placement?(cruiser, ["A1", "B2", "C3"])).to eq(false)
        expect(board.valid_placement?(submarine, ["C2", "D3"])).to eq(false)

        #if all previous checks pass then the placement should be valid
        expect(board.valid_placement?(submarine, ["A1", "A2"])).to eq(true)
        expect(board.valid_placement?(cruiser, ["B1", "C1", "D1"])).to eq(true)

    end

end