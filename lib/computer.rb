class Computer
  attr_reader :symbol

  def initialize(symbol)
    @symbol = symbol
    symbol == 'X' ? @opponent = 'O' : @opponent = 'X'
  end

  def move(game)
    best_space(game)
  end

  private

  def best_space(game, depth = 0, scores = {})
    return score(game.board) if game.over?
    game.board.available_spaces.each do |m|
      game.play(m)
      scores[m] = best_space(game, depth += 1, {})
      clear_space(game, m)
    end
    return best_move(scores) if depth == game.board.available_spaces.length
    game.current_player.symbol == @symbol ? best_score(scores) : alternate_score(scores)
  end

  def score(board)
    return -10 if board.won_by?(@opponent)
    return 10 if board.won_by?(@symbol)
    return 0 if board.tie?
  end

  def clear_space(game, move)
    game.board.clear_space(move)
    game.switch_turn
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
