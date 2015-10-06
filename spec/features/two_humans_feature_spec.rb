feature 'two humans playing a game' do
  scenario 'a tie' do
    player = Player.new('X')
    opponent = Player.new('O')
    board = Board.new
    game = Game.new(player, opponent, board)
    game.first_player = player
    game.play(1)
    game.play(2)
    game.play(3)
    game.play(5)
    game.play(8)
    game.play(4)
    game.play(6)
    game.play(9)
    game.play(7)
    expect(game.result).to eq 'tie'
    expect(board.grid).to eq %w(X O X O O X X X O)
  end

  scenario 'with a winner' do
    player = Player.new('X')
    opponent = Player.new('O')
    board = Board.new
    game = Game.new(player, opponent, board)
    game.first_player = player
    game.play(1)
    game.play(4)
    game.play(2)
    game.play(5)
    game.play(3)
    expect(board.won_by?(player.symbol)).to be true
    expect(game.winner).to eq player
    expect(board.grid).to eq(['X', 'X', 'X', 'O', 'O', 6, 7, 8, 9])
  end
end
