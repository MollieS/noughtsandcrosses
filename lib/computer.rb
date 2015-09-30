class Computer

  attr_reader :symbol

  def initialize(symbol)
    @symbol = symbol
    symbol == 'X' ? @opponent = 'O' : @opponent = 'X'
  end

  def move(board)
    best_space(board)
  end

 private 

  def best_space(board, depth = 0, scores = {})
    return score(board) if board.game_over?
    board.available_spaces.each do |m|
      make_mark(board, m)
      scores[m] = best_space(board, depth += 1, {})
      clear_board(board, m)
    end
    return best_move(scores) if depth == board.available_spaces.length
    board.current_player.symbol == @symbol ? best_score(scores) : alternate_score(scores)
  end

  def score(board)
    return -10 if board.won_by?(@opponent)
    return 10 if board.won_by?(@symbol)
    return 0 if board.tie?
  end

  def make_mark(board, move)
    board.place_mark(move)
    board.switch_turn
  end

  def clear_board(board, move)
    board.clear_space(move)
    board.switch_turn
  end

  def best_move(scores)
    scores.max_by { |_move, result| result }[0]
  end

  def best_score(scores)
    scores.max_by { |_move, result| result }[1]
  end

  def alternate_score(scores)
    scores.min_by { |_move, result| result }[1]
  end

end
