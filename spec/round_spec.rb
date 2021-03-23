require './lib/turn'
require './lib/card'
require './lib/deck'
require './lib/round'

RSpec.describe Round do

  it 'exists' do
    cards = [Card.new("What is the capital of Alaska?", "Juneau", :Geography)]
    deck = Deck.new(cards)
    round = Round.new(deck)

    expect(round).to be_instance_of(Round)
  end

  it 'starts with an empty turns array' do
    cards = [Card.new("What is the capital of Alaska?", "Juneau", :Geography)]
    deck = Deck.new(cards)
    round = Round.new(deck)

    expect(round.turns).to eq([])
  end

  it 'starts with the first card in the deck' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("What is the capital of Colombia?", "Bogota", :Geography)
    card_3 = Card.new("What planet is closest to the sun?", "Mercury", :STEM)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    round = Round.new(deck)

    expect(round.current_card).to eq(card_1)
  end


end
