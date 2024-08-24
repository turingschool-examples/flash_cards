# deck_spec.rb
require './lib/card'
require './lib/turn'
require './lib/deck'

RSpec.describe Deck do
  it 'exists' do
    card_1 = Card.new('hi1', 'bye', :whaatok)
    card_2 = Card.new('hi2', 'bye', :whaatok)
    card_3 = Card.new('hi3', 'bye', :whaatok)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)

    expect(deck).not_to be_nil
  end

  it 'has 3 cards' do
    card_1 = Card.new('hi1', 'bye', :whaatok)
    card_2 = Card.new('hi2', 'bye', :whaatok)
    card_3 = Card.new('hi3', 'bye', :whaatok)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)

    expect(deck.count).to eq(3)
  end
end
