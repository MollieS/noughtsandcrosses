module Minimax
  def best_space(board, depth = 0, best_score = {})
    return 0 if board.tie?
    return -1 if board.game_over?

    board.available_spaces.each do |space|
      board.place_mark(space)
      best_score[space] = -1 * best_space(board, depth + 1, {})
      board.clear_space(space)
    end

    best_move = best_score.max_by { |key, value| value }[0]
    highest_score = best_score.max_by { |key, value| value }[1]

    if depth == 0
      return best_move
    elsif depth > 0
      return highest_score
    end
  end
end
