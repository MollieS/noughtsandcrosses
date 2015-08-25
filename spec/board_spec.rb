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
      board.switch_turn
      board.place_mark(1)
      expect(board.grid).to include("X", "O")
    end
  end

  context '#won_by?' do
    it 'should know when someone has won' do
      won_game
      expect(board.won_by?("X")).to be true
    end
  end

  context '#rows' do
    it 'should show the rows' do
      expect(board.rows).to eq([[0, 1, 2], [3, 4, 5], [6, 7, 8]])
    end
  end

  context '#columns' do
    it 'should show the columns' do
      expect(board.columns).to eq([[0, 3, 6], [1, 4, 7], [2, 5, 8]])
    end
  end

  context '#get_diagonals' do
    it 'should show the diagonals' do
      expect(board.diagonals).to eq([[0, 4, 8], [6, 4, 2]])
    end

    context '#winning_rows' do
      it 'should show all winning positions' do
        expect(board.winning_rows).to eq(board.rows + board.columns + board.diagonals)
      end
    end

    context '#available_spaces' do
      it 'should return all free spaces' do
        expect(board.available_spaces).to eq((0..8).to_a)
      end
    end

    context '#game_over?' do
      it 'should know if game is over' do
        won_game
        expect(board.game_over?).to be true
      end
    end

    context '#clear_space' do
      it 'should empty the tile' do
        board.place_mark(5)
        board.clear_space(5)
        expect(board.grid).to eq (0..8).to_a
      end
    end

    context '#valid_move' do
      it 'should return false for an invalid move' do
        board.place_mark(5)
        expect(board.place_mark(5)).to be false
      end
    end
  end

  def won_game
    (0..7).each { |num| board.place_mark(num) }
  end
end


