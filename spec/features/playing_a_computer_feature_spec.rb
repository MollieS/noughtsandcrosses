feature 'playing a computer' do
  scenario 'when a the human goes first' do
    player = Player.new("X")
    opponent = Computer.new("O")
    board = Board.new(player, opponent)
    board.place_mark(4)
    board.place_mark(opponent.move)
    board.place_mark(2)
    board.place_mark(opponent.move)
    board.place_mark(3)
    board.place_mark(opponent.move)
    board.place_mark(5)
    board.place_mark(opponent.move)
    board.place_mark(8)
    expect(board.won?).to be false
    expect(board.grid).to eq %w(O X X X X O O O X)
  end
end
