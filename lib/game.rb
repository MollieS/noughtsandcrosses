class Game
  attr_reader :first_player, :current_player

  def initialize(player, opponent, board)
    @board = board
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
    @board.place_mark(location, current_player.symbol)
  end
end
