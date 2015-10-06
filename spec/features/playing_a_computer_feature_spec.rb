feature 'playing a computer' do
  scenario 'when a the human goes first' do
    player = Player.new('X')
    opponent = Computer.new('O')
    board = Board.new
    game = Game.new(player, opponent, board)
    game.first_player = player
    game.play(5)
    game.play(opponent.move(game))
    game.play(9)
    game.play(opponent.move(game))
    game.play(2)
    game.play(opponent.move(game))
    game.play(7)
    game.play(opponent.move(game))
    game.play(6)
    expect(board.grid).to eq %w(O X O O X X X O X)
  end

  scenario 'when a computer goes first' do
    player = Player.new('X')
    opponent = Computer.new('O')
    board = Board.new
    game = Game.new(player, opponent, board)
    game.first_player = opponent
    game.play(opponent.move(game))
    game.play(3)
    game.play(opponent.move(game))
    game.play(7)
    game.play(opponent.move(game))
    game.play(6)
    game.play(opponent.move(game))
    expect(board.won_by?('O')).to be true
  end
end
