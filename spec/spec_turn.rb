require './lib/turn'
require './lib/card'

RSpec.describe Card do
    it 'exists' do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  
      expect(card).to be_instance_of(Card)
    end
end
RSpec.describe Turn do
    it 'has a string guess and card'do
    turn = Turn.new("Juneau")

    expect(turn).to be_instance_of(Turn)
    end
end