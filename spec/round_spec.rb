require 'rspec'
require './lib/round'
require './lib/card'
require './lib/turn'
require './lib/deck'

Rspec.describe Round do
  it 'starts the round with the first card' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    round = Round.new(deck)
    round.current_card

    expect(round.current_card).to eq(deck.cards.card_1)
  end
