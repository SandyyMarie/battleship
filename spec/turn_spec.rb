require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/computer'
require './lib/player'
require './lib/game_manager'
require './lib/turn'

RSpec.describe Turn do
before :each do
    @computer = Computer.new
    @player = Player.new
    @turn = Turn.new(@computer, @player)
  end

    it 'exists' do
        expect(@turn).to be_a(Turn)
    end

    it 'can render the comp_board' do
        expect(@turn.comp_board.render).to eq("  1 2 3 4\nA . . . .\nB . . . .\nC . . . .\nD . . . .\n")
    end

    it 'can find a given cell' do 
        expect(@turn.cell_finder("A3")).to eq(@computer.board.cells["A3"])
    end

    it 'can register a players shot' do 
        @turn.player_shot("A3")
        expect(@computer.board.cells["A3"].fired_upon?).to eq(true)
        expect(@computer.board.cells["A4"].fired_upon?).to eq(false)
    end

    it 'can can have the computer choose a cell to be shot' do 
        expect(@turn.comp_shot).to be_a(Cell)
    end

    it 'can return the miss status of the players targeted cell' do
        expect(@turn.player_feedback("A3")).to eq(false) #false to indiciate it is not end of game
        #also outputs "Your shot on A3 was a miss"
    end

    it 'can return the hit status of the players targeted cell' do
         @computer.board.place(@computer.cruiser, ["A1", "A2", "A3"])
         @turn.player_shot("A3")
         expect(@turn.player_feedback("A3")).to eq(false) #false to indiciate it is not end of game
         #also outputs "Your shot on A3 was a hit"
    end

    it 'can return the miss status of the computers targeted cell' do
        cpu_shot = @turn.cell_finder("A3")
        cpu_shot.fire_upon
        expect(@turn.cpu_feedback(cpu_shot)).to eq(false) #false to indiciate it is not end of game
        #also outputs "My shot on A3 was a miss"
    end

end

