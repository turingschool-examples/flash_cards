require './lib/deck'

RSpec.describe Deck do
  it 'exists' do
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    deck = Deck.new
  end
end
