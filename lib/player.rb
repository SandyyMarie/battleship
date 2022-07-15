class Player
    attr_reader :board, :cruiser, :submarine, :ships
    def initialize
        @board = Board.new
        @cruiser = Ship.new("Cruiser", 3)
        @submarine = Ship.new("Submarine", 2)
        @ships = [@cruiser, @submarine]
        @player_ship_sunk = 0
    end

end
