require 'player'

describe Player do
  let(:player) { Player.new('X') }

  context '#symbol' do
    it 'knows the player symbol' do
      expect(player.symbol).to eq('X')
    end
  end
end
