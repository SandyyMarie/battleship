class Turn 
    attr_reader :computer, :player, :comp_board, :player_board, :money_shot

  def initialize(computer, player)
    @computer = computer
    @player = player
   
    @comp_board = @computer.board
    @player_board = @player.board
    @money_shot = []
  end

  def cell_finder(comp_choice)
    @comp_board.cells[comp_choice]
  end

  def player_shot(given_coord) #move to player?
    target_cell = cell_finder(given_coord)
    if @comp_board.valid_coordinate?(given_coord)
      target_cell.fire_upon
      @money_shot = given_coord
    else
      valid = false
      while !valid do
        puts "Please enter a valid coordinate:"
        given_coord = gets.chomp.upcase 

        valid = @comp_board.valid_coordinate?(given_coord)
        if valid = true
          target_cell = cell_finder(given_coord)
          # require "pry"; binding.pry
          target_cell.fire_upon
          @money_shot = given_coord
        end
      end
    end
    # valid
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

  def player_feedback(player_shot)
    curr_cell = @comp_board.cells[player_shot]
    play_status = ""
    all_sunk = false
# require "pry"; binding.pry
    if curr_cell.fired_upon? && !curr_cell.empty?
      play_status = "hit"
    else #if curr_cell.fired_upon? == false && curr_cell.empty? == true
      play_status = "miss"
    end

    if all_sunk == false
      puts "Your shot on #{curr_cell.coordinate} was a #{play_status}"
      if curr_cell.ship != nil
        if curr_cell.ship.sunk?
          @computer.increase_ship_sunk
          puts "My #{curr_cell.ship.name} has been sunk"
        end
      end


      if @player.ships_sunk == 2  #may not need, review later
        all_sunk = true
        puts "Aww the Computer Wins!"
        puts "Game Over!"
      end
    end
    all_sunk
  end

  def cpu_feedback(comp_shot)

    cpu_status = ""

    all_sunk = false

    if comp_shot.fired_upon? && !comp_shot.empty?
      cpu_status = "hit"
    elsif comp_shot.fired_upon? && comp_shot.empty?
      cpu_status = "miss"
    elsif comp_shot.ship.health == 0
      @computer.increase_ship_sunk
    end

    if all_sunk == false
      puts "My shot on #{comp_shot.coordinate} was a #{cpu_status}"
      if comp_shot.ship != nil
        if !comp_shot.empty? && comp_shot.ship.health == 0
          @player.increase_ship_sunk
          puts "Your #{comp_shot.ship.name} has been sunk"
        end
      end

      if @computer.ships_sunk == 2 #may not need, review later
        all_sunk = true
        puts "Yay You Win!"
        puts "Game Over!"
      end
    end
    all_sunk
  end


  def board_output
    if @computer.ships_sunk == 2
        puts "Yay You Win!"
        puts "Game Over!"
        return true
    end

    if @player.ships_sunk == 2
        puts "Aww the Computer Wins!"
        puts "Game Over!"
        return true
    end

    puts "=============COMPUTER BOARD============="
    print @comp_board.render(true) #added true for debugging, remove before submitting

    puts "==============PLAYER BOARD=============="
    print @player_board.render(true)

    puts "Enter the coordinate for your shot:"
    given_coord = STDIN.gets.chomp.upcase

    player_shot(given_coord)
    comp_choice = comp_shot 

    if cpu_feedback(comp_choice) == true || player_feedback(@money_shot) == true
      return true
    end
  end
end

