class Board
 
  attr_reader :grid, :player, :opponent, :current_player

  def initialize(player, opponent)
   @grid = (0..8).to_a 
   @player = player
   @opponent = opponent
   @current_player = player
  end

  def switch_turn
    @current_player == @player? @current_player = @opponent : @current_player = @player
  end

  def place_mark(location)
    return false unless valid_move(location)
    @grid[location] = @current_player.symbol 
  end

  def valid_move(location)
    !taken?(@grid[location])
  end

  def tie?
    full?
  end

  def won_by?(symbol)
    winning_rows.any? { |row| row.count(symbol) == 3 }
  end

  def winner
    return "X" if won_by?("X")
    return "O" if won_by?("O")
  end

  def rows
    @grid.each_slice(3).to_a
  end

  def columns
    rows.transpose
  end

  def diagonals
    [left_diag, right_diag]
  end

  def winning_rows
    rows + columns + diagonals
  end

  def available_spaces
    @grid.select { |space| !taken?(space) }
  end

  def game_over?
    full? || won_by?(@player.symbol) || won_by?(@opponent.symbol)
  end

  def clear_space(location)
    @grid[location] = location
  end
  private

  def full?
    @grid.all? { |tile| taken?(tile) }
  end

  def taken?(tile)
    tile == @player.symbol || tile == @opponent.symbol
  end

  

  def left_diag
    left = []
    rows.each_with_index { |row, index| left << row[index] }
    left
  end

  def right_diag
    right = []
    rows.reverse.each_with_index { |row, index| right << row[index] }
    right
  end

end
