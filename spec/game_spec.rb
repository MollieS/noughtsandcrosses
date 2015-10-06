require 'game'
require 'player'
require 'board'

describe Game do
  let(:player) { instance_double Player, symbol: "X" }
  let(:opponent) { instance_double Player, symbol: "O" }
  let(:board) { Board.new(player, opponent) }
  let(:game) { Game.new(player, opponent, board) }

  context 'setup' do

    it 'can set who goes first' do
      game.first_player = player
      expect(game.current_player).to eq player
    end

    it 'knows if it the first go' do
      expect(game.first_go?).to be true
    end
  end

  context 'playing' do
    it 'places a mark on the board' do
      game.first_player = player
      game.play(1)
      expect(board.grid[0]).to eq "X"
    end
  end
end
