require 'board'

describe Board do
  let(:player) { double :player, symbol: "X" }
  let(:opponent) { double :opponent, symbol: "O" }
  let(:board) { Board.new(player, opponent) }

  context '#place_mark' do
    it 'should put the current_players mark on the board' do
      board.place_mark(0)
      expect(board.grid).to include("X")
    end
  end

  context '#grid' do
    it 'should initialize with an empty grid' do
      expect(board.grid).to eq((0..8).to_a)
    end
  end

  context '#turns' do
    it 'should switch turns after each move' do
      board.place_mark(0)
      board.place_mark(1)
      expect(board.grid).to include("X", "O")
    end
  end
end
