require_relative 'minimax.rb'

class Computer
  include Minimax

  attr_reader :symbol

  def initialize(symbol)
    @symbol = symbol
    symbol == 'X' ? @opponent = 'O' : @opponent = 'X'
  end

  def move(board)
    best_space(board)
  end
end
