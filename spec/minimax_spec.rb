require 'minimax'
require 'board'

class DummyClass
  include Minimax

  attr_accessor :symbol
  def initialize
    @symbol = 'X'
    @opponent = 'O'
  end
end

describe DummyClass do
  let(:board) { double :board, available_spaces: (0..2).to_a }
  let(:computer) { DummyClass.new }

  context '#score' do
    it 'should return 0 for tie' do
      allow(board).to receive(:won_by?) { false }
      allow(board).to receive(:tie?) { true }
      allow(board).to receive(:game_over?) { true }
      expect(computer.best_space(board)).to eq 0
    end

    it 'should return 10 for a win' do
      allow(board).to receive(:won_by?).with('O') { false }
      allow(board).to receive(:won_by?).with('X') { true }
      allow(board).to receive(:game_over?) { true }
      expect(computer.best_space(board)).to eq 10
    end

    it 'should return -10 for a loss' do
      allow(board).to receive(:won_by?).with('O') { true }
      allow(board).to receive(:won_by?).with('X') { false }
      allow(board).to receive(:game_over?) { true }
    end
  end
end
