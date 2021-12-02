require './lib/card'
require './lib/deck'

RSpec.describe Deck do
  it 'exists' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)  
    deck = Deck.new(card)

    expect(deck).to be_instance_of(Deck)
  end

end
