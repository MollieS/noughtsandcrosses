feature 'two humans playing a game' do
  scenario 'a tie' do
    player = Player.new("X")
    opponent = Player.new("O")
    board = Board.new(player, opponent)
    board.place_mark(0)
    board.place_mark(1)
    board.place_mark(2)
    board.place_mark(4)
    board.place_mark(7)
    board.place_mark(3)
    board.place_mark(5)
    board.place_mark(8)
    board.place_mark(6)
    expect(board.tie?).to be true
    expect(board.grid).to eq %w(X O X O O X X X O)
  end
end
