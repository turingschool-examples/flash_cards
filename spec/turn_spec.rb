require './lib/turn'
require './lib/card'


RSpec.describe Turn do
  describe '#initialize' do
    it 'has two arguments'
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn).to be_instance_of(Turn)
  end
end
