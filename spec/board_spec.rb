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

    it 'valid_coordinate? - has valid coordinates' do
        expect(board.valid_coordinate?("A1")).to eq(true)
        expect(board.valid_coordinate?("D4")).to eq(true)
        expect(board.valid_coordinate?("A5")).to eq(false)
        expect(board.valid_coordinate?("E1")).to eq(false)
        expect(board.valid_coordinate?("A22")).to eq(false)
    end

    it 'is_occupied? - checks if cell is ocupied' do 
        cruiser = Ship.new("Cruiser", 3)
        board.place(cruiser, ["A1", "A2", "A3"])    
        expect(board.is_occupied?(["A1"])).to eq(true)
    end

    it 'vertical_check - check if given coordinates are vertical' do
        expect(board.vertical_check(["A1", "A2"])).to eq(false)
        expect(board.vertical_check(["A1", "B1"])).to eq(true)
    end

    it 'horizontal_check - check if given coordinates are horizontal' do
        expect(board.horizontal_check(["A1", "A2"])).to eq(true)
        expect(board.horizontal_check(["A1", "B1"])).to eq(false)
    end

    it 'diagonal_check - check if given coordinates are diagonal' do
        expect(board.diagonal_check(["A1", "A2"])).to eq(false)
        epxect(board.diagonal_check(["A1", "B2"])).to eq(true)
    end
        

    it 'valid placement - checks if ship and cell are same length ' do 
        board = Board.new
        cruiser = Ship.new("Cruiser", 3)
        submarine = Ship.new("Submarine", 2)
# Stephen - add edge case
        expect(board.valid_placement?(cruiser, ["A1", "A2"])).to eq(false)
        expect(board.valid_placement?(submarine, ["A2", "A3", "A4"])).to eq(false)
    end

    it 'valid placement - checks that ships cannot be placed in occupied cells' do
        board = Board.new
        cruiser = Ship.new("Cruiser", 3)
        submarine = Ship.new("Submarine", 2)
        board.place(cruiser, ["A1", "A2", "A3"])  

        expect(board.valid_placement?(submarine, ["A1", "A2"])).to eq(false)
    end


    it 'valid placement - checks if coordinates are consecutive' do 
        board = Board.new
        cruiser = Ship.new("Cruiser", 3)
        submarine = Ship.new("Submarine", 2)
#stephen - add edge case
        expect(board.valid_placement?(cruiser, ["A1", "A2", "A4"])).to eq(false)
        expect(board.valid_placement?(submarine, ["A1", "C1"])).to eq(false)
        expect(board.valid_placement?(cruiser, ["A3", "A2", "A1"])).to eq(false)
        expect(board.valid_placement?(submarine, ["C1", "B1"])).to eq(false)
    end


    it 'valid placement - checks ship cannot placed diagonally' do 
        board = Board.new
        cruiser = Ship.new("Cruiser", 3)
        submarine = Ship.new("Submarine", 2)

        expect(board.valid_placement?(cruiser, ["A1", "B2", "C3"])).to eq(false)
        expect(board.valid_placement?(submarine, ["C2", "D3"])).to eq(false)
    end

    it 'valid placement - ship can be placed horizontally' do
        board = Board.new
        cruiser = Ship.new("Cruiser", 3)
        submarine = Ship.new("Submarine", 2)

        expect(board.valid_placement?(submarine, ["A1", "A2"])).to eq(true)
    end

    it 'valid placement - ship can be placed vertically' do
        board = Board.new
        cruiser = Ship.new("Cruiser", 3)
        submarine = Ship.new("Submarine", 2)

        expect(board.valid_placement?(cruiser, ["B1", "C1", "D1"])).to eq(true)
    end

    it 'can place' do
        board = Board.new
        cruiser = Ship.new("Cruiser", 3)
        submarine = Ship.new("Submarine", 2)
        board.place(cruiser, ["A1", "A2", "A3"])
        board.place(submarine, ["B2", "B3"])
        cell_1 = board.cells["A1"]
        cell_2 = board.cells["A2"]
        cell_3 = board.cells["A3"]
        cell_4 = board.cells["B2"]
        cell_5 = board.cells["B3"]
        expect(cell_1.ship).to eq(cruiser)
        expect(cell_2.ship).to eq(cruiser)
        expect(cell_3.ship).to eq(cruiser)
        expect(cell_4.ship).to eq(submarine)
        expect(cell_5.ship).to eq(submarine)
    end

    it 'renders the board empty to start' do
        board = Board.new
        cruiser = Ship.new("Cruiser", 3)
        expect(board.render). to eq("  1 2 3 4\nA . . . .\nB . . . .\nC . . . .\nD . . . .\n")
    end


    it 'board renders and displays places ship' do
        board = Board.new
        cruiser = Ship.new("Cruiser", 3)
        board.place(cruiser, ["B1", "B2", "B3"])
        cell_1 = board.cells["B1"]
        cell_2 = board.cells["B2"]
        cell_3 = board.cells["B3"]


        expect(cell_1.render(true)).to eq("S")
        expect(cell_2.render(true)).to eq("S")
        expect(cell_3.render(true)).to eq("S")
        expect(board.render(true)).to eq("  1 2 3 4\nA . . . .\nB S S S .\nC . . . .\nD . . . .\n")
    end
end