require './lib/board'

class GameManager
  attr_reader :player, :computer, :turn
    def initialize 
        @player = Player.new
        @computer = Computer.new
        @turn = Turn.new(@computer, @player)
    end


    def welcome_message
        puts "Welcome to BATTLESHIP"
        puts "Enter p to play. Enter q to quit."
        input = gets.chomp
    if input == "p"
        return "p"
    elsif input == "q"
        puts "Now exiting game"
        return "q"
    else
        puts "Invalid entry, please use p or q"
        input = gets.chomp
    end
    end 


    def setup 
        @computer.starting_board 
        puts "You now need to lay out your two ships."
        puts "The Cruiser is three units long and the Submarine is two units long."

        print @player.board.render
        puts "Enter the squares for the Cruiser (3 spaces):"
        cru_placement_input = gets.chomp.upcase.split 
        if @player.board.valid_placement?(@player.cruiser, cru_placement_input)
            @player.board.place(@player.cruiser, cru_placement_input)
            print @player.board.render(true)         
        else 
            validity = false
            while validity != true
                puts "Those are invalid coordinates. Please try again:"
                cru_placement_input = gets.chomp.upcase.split
                validity = @player.board.valid_placement?(@player.cruiser, cru_placement_input)
            end
            @player.board.place(@player.cruiser, cru_placement_input)
            print @player.board.render(true)
        end

        puts "Enter the squares for the Submarine (2 spaces):"
        sub_placement_input = gets.chomp.upcase.split
        if @player.board.valid_placement?(@player.submarine, sub_placement_input)
            @player.board.place(@player.submarine, sub_placement_input)
            print @player.board.render(true)
        else
            validity = false
        while validity != true
            puts "Those are invalid coordinates. Please try again:"
            sub_placement_input = gets.chomp.upcase.split
            validity = @player.board.valid_placement?(@player.submarine, sub_placement_input)
        end
            @player.board.place(@player.submarine, sub_placement_input)
            print @player.board.render(true)
        end
    end


    def end_game
        if @player.ships_sunk == 2
          puts "Aww the Computer Wins!"
          exit(true)
        elsif @computer.ships_sunk == 2
          puts "Yay You Win!"
          exit(true)
        end
      end

      def turn
        _exit = false
    
        while !_exit
          _exit = @turn.board_output
        end
        _exit
      end
    
end

