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

    it 'switches turns' do
      game.first_player = player
      game.play(1)
      expect(game.current_player.symbol).to eq "O"
    end

    it 'knows when the game is tied' do
      tie_game
      expect(game.result).to eq "tie"
    end

    it 'knows when the game is won' do
      won_game
      expect(game.result).to eq "won"
    end

    it 'knows when the game is over' do
      won_game
      expect(game.over?).to be true
    end

    it 'knows the winner' do
      won_game
      expect(game.winner).to eq player
    end
  end

  def tie_game
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
  end

  def won_game
    game.first_player = player
    game.play(1)
    game.play(4)
    game.play(2)
    game.play(5)
    game.play(3)
  end
end
