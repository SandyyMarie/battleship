class Ship

    attr_reader :name, :length, :health

    def initialize(name, length) 
        @name = name
        @length = length
        @health = length
    end

    def sunk?
        @health < 1
    end

    def hit
        @health -= 1
    end

    def render(reveal = false)
        if reveal == true && !empty? && @fired_upon == false
          "S"
        elsif !empty? && @fired_upon == false
          "."
        elsif @fired_upon == true && !empty? && @ship.sunk?
          "X"
        elsif @fired_upon == true && !empty? && !@ship.sunk?
          "H"
        elsif @fired_upon == true && empty?
          "M"
        elsif @fired_upon == false && empty?
          "."
        end
      end
end
