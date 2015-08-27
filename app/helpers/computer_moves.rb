module ComputerMoves
  def computer_first?
    @board.current_player.class == Computer && first_go?
  end

  def computer_move
    @board.place_mark(@board.current_player.move(@board))
    @board.switch_turn
    reset_board
  end

  def reset_board
    session[:game] = @board
  end

end
