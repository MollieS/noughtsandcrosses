feature 'playing a computer' do
  scenario 'when the human goes first' do
    player = Player.new('X')
    opponent = Computer.new('O')
    game = Game.new(player, opponent, Board.new)
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
    expect(game.board.grid).to eq %w(O X O O X X X O X)
  end

  scenario 'when a computer goes first' do
    player = Player.new('X')
    opponent = Computer.new('O')
    game = Game.new(player, opponent, Board.new)
    game.first_player = opponent
    game.play(opponent.move(game))
    game.play(3)
    game.play(opponent.move(game))
    game.play(7)
    game.play(opponent.move(game))
    game.play(6)
    game.play(opponent.move(game))
    expect(game.winner).to eq opponent
  end
end
