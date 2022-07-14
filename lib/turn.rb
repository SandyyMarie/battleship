class Turn 
    attr_reader :comp_board, :player_board

  def initialize(comp_board, player_board)
    @comp_board = comp_board
    @player_board = player_board
    @player_ship_sunk = 0
    @cpu_ship_sunk = 0
  end