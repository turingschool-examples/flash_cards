require './lib/turn'
require './lib/card'


describe Turn do
  describe '#initialize' do
    it 'turn instance' do
      turn = Turn.new('Juneau', card)
      expect(turn).to be_an_instance_of Turn
    end
  end
end
