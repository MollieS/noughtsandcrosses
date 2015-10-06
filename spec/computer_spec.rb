require 'computer'
require 'board'
require 'player'

describe Computer do
  let(:computer) { Computer.new('O') }
  let(:player) { instance_double Player, symbol: 'X' }
  let(:board) { Board.new }
  let(:game) { Game.new(computer, player, board) }

  it 'shows the symbol' do
    expect(computer.symbol).to eq 'O'
  end

  it 'returns the only availible space for an almost full board' do
    game.first_player = computer
    game.play(computer.move(game))
    game.play(5)
    game.play(computer.move(game))
    game.play(3)
    game.play(computer.move(game))
    game.play(4)
    game.play(computer.move(game))
    game.play(8)
    expect(computer.move(game)).to eq 9
  end

  it 'blocks a player win' do
    game.first_player = player
    game.play(7)
    game.play(computer.move(game))
    game.play(8)
    expect(computer.move(game)).to eq 9
  end

  it 'goes for available win' do
    game.first_player = computer
    game.play(computer.move(game))
    game.play(7)
    game.play(computer.move(game))
    game.play(8)
    expect(computer.move(game)).to eq 3
  end
end
