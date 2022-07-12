class Board
    attr_reader :cells

    def initialize
        @cells = {
                "A1" => Cell.new("A1"),
                "A2" => Cell.new("A2"),
                "A3" => Cell.new("A3"),
                "A4" => Cell.new("A4"),
                "B1" => Cell.new("B1"),
                "B2" => Cell.new("B2"),
                "B3" => Cell.new("B3"),
                "B4" => Cell.new("B4"),
                "C1" => Cell.new("C1"),
                "C2" => Cell.new("C2"),
                "C3" => Cell.new("C3"),
                "C4" => Cell.new("C4"),
                "D1" => Cell.new("D1"),
                "D2" => Cell.new("D2"),
                "D3" => Cell.new("D3"),
                "D4" => Cell.new("D4")
                }
    end

    def valid_coordinate?(coord)
        @cells.any? {|cell| cell.include?(coord)}
    end

    def valid_placement?(ship, coord)
        pass = false

        if ship.length != coord.length
            pass = false
        elsif is_occupied?(coord) == true #checks to make sure no overlap
            pass = false
        elsif horizontal_check(coord) == true
            pass = true
        elsif vertical_check(coord) == true
            pass = true
        elsif diagonal_check(coord) == true
            pass = false
        end

        pass
     end
end