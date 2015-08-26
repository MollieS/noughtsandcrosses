require 'computer'

describe Computer do
  let(:computer) { Computer.new('O') }

  context '#symbol' do
    it 'should show the symbol' do
      expect(computer.symbol).to eq 'O'
    end
  end
end
