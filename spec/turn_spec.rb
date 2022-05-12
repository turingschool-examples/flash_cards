require './lib/turn'
require './lib/card'
RSpec.describe Turn do
  it 'exists' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    expect(turn). to be_instance_of(Turn)
  end

  xit 'has a card' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new(Juneau", card)
  end
  
end
