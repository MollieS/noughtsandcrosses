module Minimax
  def best_space(board, depth = 0, scores = {})
    return score(board) if board.game_over?
    board.available_spaces.each do |m|
      board.place_mark(m)
      board.switch_turn
      scores[m] = best_space(board, depth += 1, {})
      board.clear_space(m)
      board.switch_turn
    end
    return defense_move(scores) if depth == board.available_spaces.length
    board.current_player.symbol == @symbol ? best_move(scores) : defend(scores)
  end

  def score(board)
    return 10 if board.won_by?(@symbol)
    return 0 if board.tie?
    return -10 if board.won_by?(@opponent)
  end

  def defense_move(scores)
    return scores.max_by { |move, result| result}[0]
  end

  def best_move(scores)
    scores.max_by { |move, result| result }[1]
  end

  def defend(scores)
    scores.min_by { |move, result| result }[1]
  end

end
