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
    # turn = Turn.new('this is my guess', card)
    deck = Deck.new(cards)

    expect(deck).not_to be_nil
  end
end
