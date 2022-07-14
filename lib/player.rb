class Player
    def initialize
        player_board = Board.new
        player_cruiser = Ship.new("Cruiser", 3)
        player_submarine = Ship.new("Submarine", 2)
    end

end
