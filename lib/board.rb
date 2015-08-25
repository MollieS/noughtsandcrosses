class Board
 
  attr_reader :grid

  def initialize(player, opponent)
   @grid = (0..8).to_a 
   @player = player
   @opponent = opponent
   @current_player = player
  end

  def place_mark(location)
    @grid[location] = @current_player.symbol 
    switch_turn
  end

  def tie?
    full?
  end

  private

  def full?
    @grid.all? { |tile| taken?(tile) }
  end

  def taken?(tile)
    tile == @player.symbol || tile == @opponent.symbol
  end

  def switch_turn
    @current_player == @player? @current_player = @opponent : @current_player = @player
  end

end
