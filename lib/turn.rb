class Turn 
    attr_reader :computer, :player, :comp_board, :player_board

  def initialize(computer, player)
    @computer = computer
    @player = player
   
    @comp_board = @computer.board
    @player_board = @player.board
  end

  def cell_finder(comp_choice)
    @comp_board.cells[comp_choice]
  end

  def player_shot(given_coord) #move to player?
    target_cell = cell_finder(given_coord)
    if @comp_board.valid_coordinate?(given_coord)
      target_cell.fire_upon
    else
      valid = false
      while !valid do
        puts "Please enter a valid coordinate:"
        given_coord = gets.chomp
        if @comp_board.valid_coordinate?(given_coord)
          valid = true
          target_cell = cell_finder(given_coord)
          target_cell.fire_upon
        end
      end
    end
    valid
  end

  def comp_shot
    final_choice = ""
    @comp_random_shot = @player_board.cells.values.find_all{|cell| cell}

    test_choice = @comp_random_shot.sample

    valid = false
    while !valid
      if test_choice.fired_upon? == false
        test_choice.fire_upon
        valid = true
        final_choice = test_choice
      elsif test_choice.fired_upon? == true
        test_choice = @comp_random_shot.sample
        valid = false
      end
    end
    valid
    final_choice
  end


  def board_output
    puts "=============COMPUTER BOARD============="
    print @comp_board.render(true) #added true for debugging, remove before submitting

    puts "==============PLAYER BOARD=============="
    print @player_board.render(true)

    puts "Enter the coordinate for your shot:"
    given_coord = STDIN.gets.chomp.upcase

    player_shot(given_coord)
    comp_choice = comp_shot 

    if cpu_feedback(comp_choice) == true || player_feedback(given_coord) == true
      return true
    end
  end
end

