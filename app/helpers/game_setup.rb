module Setup
  def opponent_symbol
    params[:symbol] == 'X' ? opponent_symbol = 'O' : opponent_symbol = 'X'
  end

  def set_opponent
    params[:players] == 'two_humans' ? Player.new(opponent_symbol) : Computer.new(opponent_symbol)
  end

  def two_player_game
    params[:first_player] == 'player1' ? Board.new(player1, set_opponent) : Board.new(set_opponent, player1)
  end

  def human_computer_game
    params[:first_player] == 'player1' ? Board.new(player1, set_opponent) : Board.new(set_opponent, player1)
  end

  def player1
    Player.new(params[:symbol])
  end

  def computer_v_computer_game
    params[:first_player] == 'player1' ? Board.new(Computer.new(params[:symbol]), Computer.new(opponent_symbol)) : Board.new(Computer.new(opponent_symbol), Computer.new(params[:symbol]))
  end
end
