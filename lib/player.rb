class Player
    attr_reader :board, :cruiser, :submarine, :ships, :ships_sunk
    def initialize
        @board = Board.new
        @cruiser = Ship.new("Cruiser", 3)
        @submarine = Ship.new("Submarine", 2)
        @ships = [@cruiser, @submarine]
        @ships_sunk = 0
    end

    def increase_ship_sunk
        @ships_sunk += 1
    end
end
