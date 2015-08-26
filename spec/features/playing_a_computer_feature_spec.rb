feature 'playing a computer' do
  scenario 'when a the human goes first' do
    player = Player.new('X')
    opponent = Computer.new('O')
    board = Board.new(player, opponent)
    board.place_mark(4)
    board.switch_turn
    board.place_mark(opponent.move(board))
    board.switch_turn
    board.place_mark(8)
    board.switch_turn
    board.place_mark(opponent.move(board))
    board.switch_turn
    board.place_mark(1)
    board.switch_turn
    board.place_mark(opponent.move(board))
    board.switch_turn
    board.place_mark(6)
    board.switch_turn
    board.place_mark(opponent.move(board))
    board.switch_turn
    board.place_mark(5)
    expect(board.grid).to eq %w(O X O O X X X O X)
  end
end
