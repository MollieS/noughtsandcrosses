class Game
  attr_reader :first_player, :current_player

  def initialize(player, opponent, board)
    @board = board
    @player = player
    @opponent = opponent
  end

  def first_player=player
    @first_player = player
    set_first_move
  end

  def first_go?
    @board.clear?
  end

  def set_first_move
    @current_player = @first_player if first_go?
  end

  def play(location)
    @board.place_mark(location, @current_player.symbol)
    switch_turn
  end

  def switch_turn
    @current_player == @player ? @current_player = @opponent : @current_player = @player
  end

  def result
    return 'tie' if @board.tie?
    return 'won' if @board.won_by?("X") || @board.won_by?("O")
  end

  def winner
    @board.won_by?(@player.symbol) ? @player : @opponent
  end

  def over?
    result != nil
  end
end
