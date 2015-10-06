require 'board'

describe Board do
  let(:player) { double :player, symbol: 'X' }
  let(:opponent) { double :opponent, symbol: 'O' }
  let(:board) { Board.new(player, opponent) }

  context 'positions' do
    it 'shows the rows' do
      expect(board.rows).to eq([[1, 2, 3], [4, 5, 6], [7, 8, 9]])
    end

    it 'shows the columns' do
      expect(board.columns).to eq([[1, 4, 7], [2, 5, 8], [3, 6, 9]])
    end

    it 'shows the diagonals' do
      expect(board.diagonals).to eq([[1, 5, 9], [7, 5, 3]])
    end

    it 'shows all winning positions' do
      expect(board.winning_rows).to eq(board.rows + board.columns + board.diagonals)
    end

    it 'returns all free spaces' do
      expect(board.available_spaces).to eq((1..9).to_a)
    end
  end

  context 'playing' do
    it 'puts the current_players mark on the board' do
      board.place_mark(1)
      expect(board.grid[0]).to eq "X"
    end

    it 'initializes with an empty grid' do
      expect(board).to be_clear
    end

    it 'switchs turns after each move' do
      board.place_mark(0)
      board.switch_turn
      board.place_mark(1)
      expect(board.grid).to include('X', 'O')
    end

    it 'keeps switching turns' do
      board.switch_turn
      board.switch_turn
      board.switch_turn
      expect(board.current_player.symbol).to eq('O')
    end

    it 'knows when someone has won' do
      won_game
      expect(board.won_by?('X')).to be true
    end

    it 'knows if game is over' do
      won_game
      expect(board.game_over?).to be true
    end

    it 'empties the tile' do
      board.place_mark(5)
      board.clear_space(5)
      expect(board).to be_clear
    end

    it 'returns false for an invalid move' do
      board.place_mark(5)
      expect(board.place_mark(5)).to be false
    end
  end

  def won_game
    (1..8).each { |num| board.place_mark(num) }
  end
end
