require './lib/deck'
require './lib/card'

RSpec.describe Deck do
  it 'exists' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    cards = [card]
    deck = Deck.new(cards)

    expect(deck).to be_instance_of(Deck)
  end

end