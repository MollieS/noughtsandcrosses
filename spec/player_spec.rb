require 'player'

describe Player do
  let(:player) { Player.new("X") }

  context '#symbol' do
    it 'should know the player symbol' do
      expect(player.symbol).to eq("X")
    end
  end
end
