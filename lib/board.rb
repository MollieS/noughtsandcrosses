class Board
  attr_reader :player, :opponent, :current_player
  attr_accessor :grid

  def initialize
    @grid = (1..9).to_a
  end
  def place_mark(location, symbol)
    return false unless valid_move(location)
    @grid[location - 1] = symbol
  end

  def valid_move(location)
    !taken?(@grid[location - 1]) && location < 10
  end

  def tie?
    full? && !won_by?("X") && !won_by?("O")
  end

  def won_by?(symbol)
    winning_rows.any? { |row| row.count(symbol) == 3 }
  end

  def winner
    return 'X' if won_by?('X')
    return 'O' if won_by?('O')
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

  def clear_space(location)
    @grid[location - 1] = location
  end

  def clear?
    @grid.all? { |tile| !taken?(tile) }
  end

  private

  def full?
    @grid.all? { |tile| taken?(tile) }
  end

  def taken?(tile)
    tile == "X" || tile == "O"
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
