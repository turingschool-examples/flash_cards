require './lib/turn'
require './lib/card'
require './lib/deck'
require './lib/round'

RSpec.describe Round do

  it 'exists' do
    cards = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    deck = Deck.new(cards)
    round = Round.new(deck)

    expect(round).to be_instance_of(Round)
  end

  it 'starts with an empty turns array' do
    cards = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    deck = Deck.new(cards)
    round = Round.new(deck)

    expect(round.turns).to eq([])
  end


end
