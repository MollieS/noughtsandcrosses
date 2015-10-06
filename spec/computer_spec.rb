require 'computer'
require 'board'

describe Computer do
  let(:computer) { Computer.new('O') }
  let(:player) { double :player, symbol: 'X' }
  let(:board) { Board.new(computer, player) }

  it 'shows the symbol' do
    expect(computer.symbol).to eq 'O'
  end

  xit 'returns the only availible space for an almost full board' do
    board.place_mark(computer.move(board))
    board.switch_turn
    board.place_mark(5)
    board.switch_turn
    board.place_mark(computer.move(board))
    board.switch_turn
    board.place_mark(3)
    board.switch_turn
    board.place_mark(computer.move(board))
    board.switch_turn
    board.place_mark(4)
    board.switch_turn
    board.place_mark(computer.move(board))
    board.switch_turn
    board.place_mark(8)
    board.switch_turn
    expect(computer.move(board)).to eq 9
  end

  xit 'blocks a player win' do
    board = Board.new(player, computer)
    board.place_mark(7)
    board.switch_turn
    board.place_mark(computer.move(board))
    board.switch_turn
    board.place_mark(8)
    board.switch_turn
    expect(computer.move(board)).to eq 9
  end

  xit 'goes for available win' do
    board.place_mark(computer.move(board))
    board.switch_turn
    board.place_mark(7)
    board.switch_turn
    board.place_mark(computer.move(board))
    board.switch_turn
    board.place_mark(8)
    board.switch_turn
    expect(computer.move(board)).to eq 3
  end
end
