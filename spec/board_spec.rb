require 'board'

describe Board do
  context 'positions' do
    it 'shows the rows' do
      expect(subject.rows).to eq([[1, 2, 3], [4, 5, 6], [7, 8, 9]])
    end

    it 'shows the columns' do
      expect(subject.columns).to eq([[1, 4, 7], [2, 5, 8], [3, 6, 9]])
    end

    it 'shows the diagonals' do
      expect(subject.diagonals).to eq([[1, 5, 9], [7, 5, 3]])
    end

    it 'shows all winning positions' do
      expect(subject.winning_rows).to eq(subject.rows + subject.columns + subject.diagonals)
    end

    it 'returns all free spaces' do
      expect(subject.available_spaces).to eq((1..9).to_a)
    end
  end

  context 'playing' do
    it 'puts a mark on the board' do
      subject.place_mark(1, 'X')
      expect(subject.grid[0]).to eq 'X'
    end

    it 'initializes with an empty grid' do
      expect(subject).to be_clear
    end

    it 'knows when someone has won' do
      won_game
      expect(subject.won_by?('X')).to be true
    end

    it 'empties the tile' do
      subject.place_mark(5, 'X')
      subject.clear_space(5)
      expect(subject).to be_clear
    end

    it 'returns false for a taken space' do
      subject.place_mark(5, 'X')
      expect(subject.place_mark(5, 'O')).to be false
    end

    it 'returns false for a move out of bounds' do
      expect(subject.place_mark(10, 'X')).to be false
    end
  end

  def won_game
    subject.place_mark(1, 'X')
    subject.place_mark(2, 'O')
    subject.place_mark(3, 'X')
    subject.place_mark(4, 'O')
    subject.place_mark(5, 'X')
    subject.place_mark(6, 'O')
    subject.place_mark(7, 'X')
    subject.place_mark(8, 'O')
  end
end
