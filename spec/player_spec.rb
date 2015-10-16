require 'player'

describe Player do
  let(:player) { Player.new('X') }

  it 'knows the player symbol' do
    expect(player.symbol).to eq('X')
  end
end
